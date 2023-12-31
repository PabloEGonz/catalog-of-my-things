require './game'
require './author'
require_relative 'app'
require './item'
require './music_album'
require './genre'
require 'date'
require './book'
require './label'
require './storage'
require 'json'

puts 'Welcome to Catalog of my things!'

def read_files(app)
  @app.storage.retrieve_data(app)
end

def write_files
  @app.storage.save_games(@app.games)
  @app.storage.save_books(@app.books)
  @app.storage.save_music_albums(@app.music_albums)
  @app.storage.save_labels(@app.labels)
  @app.storage.save_authors(@app.authors)
  @app.storage.save_genres(@app.genres)
end

def main
  if @app.nil?
    @app = App.new
    read_files(@app)
  end
  @app.options
  option = gets.chomp.to_i
  valid_options = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  if valid_options.include?(option)
    if option == 10
      write_files
      puts 'Thanks for using this app'
    else
      @app.trigger(option)
      main
    end
  else
    puts ['Error, choose one of the options', '']
    main
  end
end

main
