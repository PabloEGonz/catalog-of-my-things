require_relative '../input'
require_relative '../book'

class BookHandler
  def initialize
    @input = Input.new
  end

  def add
    publisher = @input.getter("Enter the publisher's name: ")
    cover_state = @input.getter("What is the book's cover state (good/bad): ")
    publish_date = @input.getter('Published date [YYYY-MM-DD]: ')
    Book.new(Date.new(publish_date.to_i), publisher, cover_state)
  end

  def list(books)
    if books.empty?
      puts 'There are not books created yet'
    else
      books.each_with_index do |book, i|
        puts "- #{i + 1}) Title: '#{book.publisher}, Author: '#{book.publish_date}"
      end
    end
  end
end
