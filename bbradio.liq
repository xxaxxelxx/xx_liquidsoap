# Input the stream,
# from an Icecast server or any other source

c_name="BB RADIO"
c_id="bbradio"
c_id_short="bbr"
c_desc="Voll die Vielfalt."
c_genre="Hot AC"
c_pass="IC_SOURCE_PASS"
c_host="IC_HOST"
c_port=IC_PORT
c_url="http://www.#{c_id}.de"

url = "http://#{c_host}:#{c_port}/#{c_id_short}_master.mp3"
input = mksafe(input.http(url))
set("log.file.path","/var/log/liquidsoap/#{c_id}.log")


# MP3 128 STEREO
output.icecast(
  %mp3(samplerate=44100, internal_quality=2, bitrate=128, stereo=true),
  mount="/#{c_id}.mp3",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

# MP3 64 MONO
output.icecast(
  %mp3(samplerate=44100, internal_quality=2, bitrate=64, stereo=false),
  mount="/#{c_id}-mobile.mp3",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  mean(input))

# OGG VORBIS
output.icecast(
  %vorbis,
#  %vorbis(channels=2, quality=0.4),
#  %vorbis(samplerate=44100, channels=2, quality=0.9),
#  %vorbis.abr(samplerate=44100, channels=2, bitrate=128, max_bitrate=192, min_bitrate=64),
#  %vorbis.cbr(samplerate=44100, channels=2, bitrate=128),
  mount="/#{c_id}.ogg",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

# OGG OPUS
output.icecast(
  %opus,
#  %opus(bitrate=64),      
  mount="/#{c_id}.opus",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

# HE-AAC v2
output.icecast(
  %fdkaac(channels=2, samplerate=44100, aot="mpeg2_he_aac_v2", transmux="adts", sbr_mode=false, bitrate=48),
  mount="/#{c_id}.aac",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)


#    OPUS
#    vbr: one of "none", "constrained" or "unconstrained"
#    application: One of "audio", "voip" or "restricted_lowdelay"
#    complexity: Integer value between 0 and 10.
#    max_bandwidth: One of "narrow_band", "medium_band", "wide_band", "super_wide_band" or "full_band"
#    samplerate: input samplerate. Must be one of: 8000, 12000, 16000, 24000 or 48000
#    frame_size: encoding frame size, in milliseconds. Must be one of: 2.5, 5., 10., 20., 40. or 60..
#    bitrate: encoding bitrate, in kbps. Must be a value between 5 and 512. You can also set it to "auto".
#    channels: currently, only 1 or 2 channels are allowed.
#    mono, stereo: equivalent to channels=1 and channels=2.
#    signal: one of "voice" or "music"
