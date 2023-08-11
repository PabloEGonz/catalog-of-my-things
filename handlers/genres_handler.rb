require_relative '../input'
require_relative '../genre'

class GenresHandler
  def initialize
    @input = Input.new
  end

  def add
    name = @input.getter('Enter a genre name: ')
    Genre.new(name)
  end

  def list(genres)
    if genres.empty?
      puts 'There are no genres created yet'
    else
      genres.each_with_index do |genre, i|
        puts "- #{i + 1}) Name: '#{genre.name}"
      end
    end
  end

  def save_data(genres)
    array = genres.map do |ele|
      {
        id: ele.id,
        name: ele.name
      }
    end
    File.write('genres.json', JSON.pretty_generate(array))
  end
end
