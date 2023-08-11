require_relative '../input'
require_relative '../music_album'

class AlbumsHandler
  def initialize
    @input = Input.new
  end

  def add
    publish_date = @input.getter('Enter the published date [YYYY-MM-DD]: ')
    on_spotify = @input.getter('Is it available on Spotify? [n/y]')
    MusicAlbum.new(publish_date, on_spotify)
  end

  def list(albums)
    if albums.empty?
      puts 'There are no music albums created yet'
    else
      albums.each_with_index do |album, i|
        puts "- #{i + 1}) Publish Date:#{album.publish_date} On Spotift: #{album.on_spotify}"
      end
    end
  end
end
