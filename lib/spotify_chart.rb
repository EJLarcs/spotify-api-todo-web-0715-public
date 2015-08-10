require 'json'
require 'open-uri'
require 'pry'

#3 basic parts of a URL... everything after a / tells you what specific part you want to access
class SpotifyChart

  BASE_URL = "http://charts.spotify.com/api/tracks/most_streamed"


  def get_url(region)
    # return a string that is the BASE_URL/region/weekly/latest
    "http://charts.spotify.com/api/tracks/most_streamed/#{region}/weekly/latest"
  end

  def get_json(url)
    JSON.load(open(url))
    #so basically, with JSON you cannot load the file unless its open
  end

  def get_first_track_info(music_hash)
    # example music_hash:
    # {
    #   "tracks" => [
    #     {
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"All About That Bass",
    #       "artist_name"  =>"Meghan Trainor",
    #       "album_name"   =>"Title"
    #     },
    #     {
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"Break Free",
    #       "artist_name"  =>"Ariana Grande",
    #       "album_name"   =>"Break Free"
    #     }
    #   ]
    # }
    #song, title, artist

    track_name = music_hash["tracks"][0]["track_name"]
    artist_name = music_hash["tracks"][0]["artist_name"]
    album_name = music_hash["tracks"][0]["album_name"]
    "#{track_name} by #{artist_name} from the album #{album_name}"



    # given a hash, like the one above, this method should return a string like:
    # <track name> by <artist name> from the <album name>

    # the track name, artist name, and album name should be the first track in the
    # tracks array
  end


  def most_streamed(region)
    # call on #get_url here, where preference is the string 'most_streamed',
    # and set it equal to a variable
    most_streamed_url = get_url(region)
    # call on #get_json here, using the string that get_url returns
    results = get_json(most_streamed_url)
    # finally, call on #get_first_track_info using the
    # hash that #get_json returns
    get_first_track_info(results)
  end

end
