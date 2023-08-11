require_relative '../input'
class BookHandler
  def initialize
    @input = Input.new
  end

  def add
    publisher = @input.getter('Please enter the publisher: ')
    cover_state = @input.getter('Describe the cover state of the book: ')
    publish_date = @input.getter('published date (yyyy-mm-dd): ')
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
