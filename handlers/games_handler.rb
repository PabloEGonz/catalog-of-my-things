require_relative '../input'
require_relative '../game'

class GamesHandler
  def initialize
    @input = Input.new
  end

  def add
    multiplayer = @input.getter('Is it multiplayer: ')
    last_played_at = @input.getter('Enter the last played date: ')
    publish_date = @input.getter('Enter the published date [YYYY-MM-DD]: ')
    Game.new(Date.new(publish_date.to_i), multiplayer, Date.new(last_played_at.to_i))
  end

  def list(games)
    if games.empty?
      puts 'There are not games created yet'
    else
      games.each_with_index do |game, i|
        puts "- #{i + 1}) Title: '#{game.multiplayer}, Author: #{game.last_played_at}"
      end
    end
  end

  def save_data(games)
    array = games.map do |ele|
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
        multiplayer: ele.multiplayer,
        last_played_at: ele.last_played_at
      }
    end
    File.write('games.json', JSON.pretty_generate(array))
  end
end
