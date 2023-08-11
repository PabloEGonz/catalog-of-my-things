require_relative '../input'

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
      puts 'There are not authors created yet'
    else
      authors.each_with_index do |author, i|
        puts "- #{i + 1}) Name: #{author.first_name} #{author.last_name}"
      end
    end
  end
end
