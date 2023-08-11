require_relative 'handlers/books_handler'
require_relative 'handlers/albums_handler'
require_relative 'handlers/games_handler'
require_relative 'handlers/genres_handler'
require_relative 'handlers/labels_handler'
require_relative 'handlers/authors_handler'
require_relative 'storage'
require_relative 'input'

class App
  attr_accessor :books, :games, :genres, :music_albums, :authors, :labels, :storage

  def initialize
    @storage = Storage.new
    @books = []
    @games = []
    @genres = []
    @music_albums = []
    @authors = []
    @labels = []
    @books_handler = BooksHandler.new
    @albums_handler = AlbumsHandler.new
    @games_handler = GamesHandler.new
    @input = Input.new
    @genres_handler = GenresHandler.new
    @authors_handler = AuthorsHandler.new
    @labels_handler = LabelsHandler.new
    @functions = {
      1 => :list_all_books,
      2 => :list_all_music_albums,
      3 => :list_all_games,
      4 => :list_all_genres,
      5 => :list_all_labels,
      6 => :list_all_authors,
      7 => :add_item_book,
      8 => :add_music_album,
      9 => :add_item_game
    }
  end

  def options
    puts "\nPlease choose an option by entering the number:"
    puts "1 - List all books \n2 - List all music albums"
    puts "3 - List of games \n4 - List all genres \n5 - List all labels"
    puts "6 - List all authors \n7 - Add a book"
    puts "8 - Add a music album \n9 - Add a game \n10 - Exit"
  end

  def trigger(int)
    send(@functions[int])
  end

  def list_all_books
    @books_handler.list(@books)
  end

  def list_all_music_albums
    @albums_handler.list(@music_albums)
  end

  def list_all_games
    @games_handler.list(@games)
  end

  def list_all_genres
    @genres_handler.list(@genres)
  end

  def list_all_labels
    @labels_handler.list(@labels)
  end

  def list_all_authors
    @authors_handler.list(@authors)
  end

  def add_item_book
    book = @books_handler.add
    @books << book
    add_properties(book)
    puts 'Book created succesfully'
  end

  def add_music_album
    album = @albums_handler.add
    @music_albums << album
    add_properties(album)
    puts 'Music album created succesfully'
  end

  def add_item_game
    game = @games_handler.add
    @games << game
    add_properties(game)
    puts 'Game created succesfully'
  end

  def add_properties(item)
    g = @genres.length
    l = @labels.length
    a = @authors.length

    puts "\nSelect a genre from the list (by number)"
    list_all_genres
    puts "- #{g + 1}) Create a new genre"
    i = gets.chomp.to_i
    if i <= g
      @genres[i - 1].add_item(item)
    else
      genre = @genres_handler.add
      genre.add_item(item)
      @genres << genre
    end
    puts "\nSelect a label from the list (by number)"
    list_all_labels
    puts "- #{l + 1}) Create a new label"
    j = gets.chomp.to_i
    if j <= l
      @labels[j - 1].add_item(item)
    else
      label = @labels_handler.add
      label.add_item(item)
      @labels << label
    end
    puts "\nSelect a author from the list (by number)"
    list_all_authors
    puts "- #{a + 1}) Create a new author"
    k = gets.chomp.to_i
    if k <= a
      @authors[k - 1].add_item(item)
    else
      author = @authors_handler.add
      author.add_item(item)
      @authors << author
    end
  end

  def save
    @games_handler.save_data(@games)
    @books_handler.save_data(@books)
    @albums_handler.save_data(@music_albums)
    @labels_handler.save_data(@labels)
    @authors_handler.save_data(@authors)
    @genres_handler.save_data(@genres)
  end
end
