require_relative '../input'
require_relative '../book'

class BooksHandler
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

  def save_data(books)
    array = books.map do |ele|
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
        publisher: ele.publisher,
        cover_state: ele.cover_state
      }
    end
    File.write('books.json', JSON.pretty_generate(array))
  end
end
