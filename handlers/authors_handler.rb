require_relative '../input'
require_relative '../author'

class AuthorsHandler
  def initialize
    @input = Input.new
  end

  def add
    first_name = @input.getter("Author's first name: ")
    last_name = @input.getter("Author's last name: ")
    Author.new(first_name, last_name)
  end

  def list(authors)
    if authors.empty?
      puts 'There are no authors created yet'
    else
      authors.each_with_index do |author, i|
        puts "- #{i + 1}) Name: #{author.first_name} #{author.last_name}"
      end
    end
  end

  def save_data(authors)
    array = authors.map do |ele|
      {
        id: ele.id,
        first_name: ele.first_name,
        last_name: ele.last_name
      }
    end
    File.write('authors.json', JSON.pretty_generate(array))
  end
end
