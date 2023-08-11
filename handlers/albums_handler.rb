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

  def save_data(albums)
    array = albums.map do |ele|
      {
        id: ele.id,
        publish_date: ele.publish_date,
        archived: ele.archived,
        genre_id: ele.genre.id,
        genre_name: ele.genre.name,
        author_id: ele.author.id,
        author_first_name: ele.author.first_name,
        author_last_name: ele.author.last_name,
        label_id: ele.label.id,
        label_title: ele.label.title,
        label_color: ele.label.color,
        on_spotify: ele.on_spotify
      }
    end
    File.write('music_albums.json', JSON.pretty_generate(array))
  end
end
