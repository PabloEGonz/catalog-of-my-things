require_relative '../input'
class GamesHandler
  def initialize
    @input = Input.new
  end

  def add
    multiplayer = @input.getter('Please enter the multiplayer: ')
    last_played_at = @input.getter('Please enter the date of the last played: ')
    publish_date = @input.getter('published date (yyyy-mm-dd): ')
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
end
