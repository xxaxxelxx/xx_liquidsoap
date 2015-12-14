# Input the stream,
# from an Icecast server or any other source
#######################################################################################################################################
id="ostseewelle"
c_id="#{id}-ch08"
#set("log.file.path","/var/log/liquidsoap/#{c_id}.log")
c_name="Ostseewelle"
c_desc="Hit-Radio Mecklenburg-Vorpommern."
c_host="IC_HOST"
c_port=IC_PORT
c_pass="IC_SOURCE_PASS"
c_url="http://www.#{id}.de"
c_genre="Hot AC"
#######################################################################################################################################

#######################################################################################################################################

url = "http://#{c_host}:#{c_port}/#{c_id}_master.mp3"
input = mksafe(input.http(url))

# MP3 128 STEREO
output.icecast(
  %mp3(samplerate=44100, internal_quality=2, bitrate=128, stereo=true),
  mount="/intro.#{c_id}.mp3",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

# HE-AAC v2
output.icecast(
  %fdkaac(channels=2, samplerate=44100, aot="mpeg2_he_aac_v2", transmux="adts", sbr_mode=false, bitrate=48),
  mount="/intro.#{c_id}.aac",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

#######################################################################################################################################
