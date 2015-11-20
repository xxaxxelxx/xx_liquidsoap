# Input the stream,
# from an Icecast server or any other source
#######################################################################################################################################
c_id="ostseewelle"
set("log.file.path","/var/log/liquidsoap/#{c_id}-ch.log")
c_name="Ostseewelle"
c_desc="Hit-Radio Mecklenburg-Vorpommern."
c_host="IC_HOST"
c_port=IC_PORT
c_pass="IC_SOURCE_PASS"
c_url="http://www.#{c_id}.de"
c_genre="Hot AC"

#######################################################################################################################################

url = "http://#{c_host}:#{c_port}/#{c_id}-ch00_master.mp3"
input = mksafe(input.http(url))

# MP3 128 STEREO
output.icecast(
  %mp3(samplerate=44100, internal_quality=2, bitrate=128, stereo=true),
  mount="/#{c_id}-ch00.mp3",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

# HE-AAC v2
output.icecast(
  %fdkaac(channels=2, samplerate=44100, aot="mpeg2_he_aac_v2", transmux="adts", sbr_mode=false, bitrate=48),
  mount="/#{c_id}-ch00.aac",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

#######################################################################################################################################

url = "http://#{c_host}:#{c_port}/#{c_id}-ch01_master.mp3"
input = mksafe(input.http(url))

# MP3 128 STEREO
output.icecast(
  %mp3(samplerate=44100, internal_quality=2, bitrate=128, stereo=true),
  mount="/#{c_id}-ch01.mp3",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

# HE-AAC v2
output.icecast(
  %fdkaac(channels=2, samplerate=44100, aot="mpeg2_he_aac_v2", transmux="adts", sbr_mode=false, bitrate=48),
  mount="/#{c_id}-ch01.aac",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

#######################################################################################################################################

url = "http://#{c_host}:#{c_port}/#{c_id}-ch02_master.mp3"
input = mksafe(input.http(url))

# MP3 128 STEREO
output.icecast(
  %mp3(samplerate=44100, internal_quality=2, bitrate=128, stereo=true),
  mount="/#{c_id}-ch02.mp3",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

# HE-AAC v2
output.icecast(
  %fdkaac(channels=2, samplerate=44100, aot="mpeg2_he_aac_v2", transmux="adts", sbr_mode=false, bitrate=48),
  mount="/#{c_id}-ch02.aac",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

#######################################################################################################################################

url = "http://#{c_host}:#{c_port}/#{c_id}-ch03_master.mp3"
input = mksafe(input.http(url))

# MP3 128 STEREO
output.icecast(
  %mp3(samplerate=44100, internal_quality=2, bitrate=128, stereo=true),
  mount="/#{c_id}-ch03.mp3",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

# HE-AAC v2
output.icecast(
  %fdkaac(channels=2, samplerate=44100, aot="mpeg2_he_aac_v2", transmux="adts", sbr_mode=false, bitrate=48),
  mount="/#{c_id}-ch03.aac",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

#######################################################################################################################################

url = "http://#{c_host}:#{c_port}/#{c_id}-ch04_master.mp3"
input = mksafe(input.http(url))

# MP3 128 STEREO
output.icecast(
  %mp3(samplerate=44100, internal_quality=2, bitrate=128, stereo=true),
  mount="/#{c_id}-ch04.mp3",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

# HE-AAC v2
output.icecast(
  %fdkaac(channels=2, samplerate=44100, aot="mpeg2_he_aac_v2", transmux="adts", sbr_mode=false, bitrate=48),
  mount="/#{c_id}-ch04.aac",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

#######################################################################################################################################

url = "http://#{c_host}:#{c_port}/#{c_id}-ch05_master.mp3"
input = mksafe(input.http(url))

# MP3 128 STEREO
output.icecast(
  %mp3(samplerate=44100, internal_quality=2, bitrate=128, stereo=true),
  mount="/#{c_id}-ch05.mp3",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

# HE-AAC v2
output.icecast(
  %fdkaac(channels=2, samplerate=44100, aot="mpeg2_he_aac_v2", transmux="adts", sbr_mode=false, bitrate=48),
  mount="/#{c_id}-ch05.aac",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

#######################################################################################################################################

url = "http://#{c_host}:#{c_port}/#{c_id}-ch06_master.mp3"
input = mksafe(input.http(url))

# MP3 128 STEREO
output.icecast(
  %mp3(samplerate=44100, internal_quality=2, bitrate=128, stereo=true),
  mount="/#{c_id}-ch06.mp3",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

# HE-AAC v2
output.icecast(
  %fdkaac(channels=2, samplerate=44100, aot="mpeg2_he_aac_v2", transmux="adts", sbr_mode=false, bitrate=48),
  mount="/#{c_id}-ch06.aac",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

#######################################################################################################################################

url = "http://#{c_host}:#{c_port}/#{c_id}-ch07_master.mp3"
input = mksafe(input.http(url))

# MP3 128 STEREO
output.icecast(
  %mp3(samplerate=44100, internal_quality=2, bitrate=128, stereo=true),
  mount="/#{c_id}-ch07.mp3",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

# HE-AAC v2
output.icecast(
  %fdkaac(channels=2, samplerate=44100, aot="mpeg2_he_aac_v2", transmux="adts", sbr_mode=false, bitrate=48),
  mount="/#{c_id}-ch07.aac",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

#######################################################################################################################################

url = "http://#{c_host}:#{c_port}/#{c_id}-ch08_master.mp3"
input = mksafe(input.http(url))

# MP3 128 STEREO
output.icecast(
  %mp3(samplerate=44100, internal_quality=2, bitrate=128, stereo=true),
  mount="/#{c_id}-ch08.mp3",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)

# HE-AAC v2
output.icecast(
  %fdkaac(channels=2, samplerate=44100, aot="mpeg2_he_aac_v2", transmux="adts", sbr_mode=false, bitrate=48),
  mount="/#{c_id}-ch08.aac",
  name=c_name,
  url=c_url,
  description=c_desc,
  genre=c_genre,
  host=c_host, port=c_port, password=c_pass,
  input)
