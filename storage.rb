require 'json'

class Storage
  def read(file_name)
    return unless File.exist?(file_name)

    JSON.parse(File.read(file_name))
  end

  def retrieve_games(app)
    file = read('games.json')
    return if file.nil?

    file.each do |obj|
      id = obj[id]
      publish_date = obj['publish_date']
      multiplayer = obj['multiplayer']
      last_played_at = obj['last_played_at']
      genre_id = obj['genre_id']
      genre_name = obj['genre_name']
      author_id = obj['author_id']
      author_first_name = obj['author_first_name']
      author_last_name = obj['author_last_name']
      label_id = obj['label_id']
      label_title = obj['label_title']
      label_color = obj['label_color']
      game = Game.new(Date.new(publish_date.to_i), multiplayer, last_played_at, id)
      Genre.new(genre_name, genre_id).add_item(game)
      Author.new(author_first_name, author_last_name, author_id).add_item(game)
      Label.new(label_title, label_color, label_id).add_item(game)
      app.games << game
    end
  end

  def retrieve_books(app)
    file = read('books.json')
    return if file.nil?

    file.each do |obj|
      id = obj['id']
      publisher = obj['publisher']
      cover_state = obj['cover_state']
      publish_date = obj['publish_date']
      genre_id = obj['genre_id']
      genre_name = obj['genre_name']
      author_id = obj['author_id']
      author_first_name = obj['author_first_name']
      author_last_name = obj['author_last_name']
      label_id = obj['label_id']
      label_title = obj['label_title']
      label_color = obj['label_color']
      book = Book.new(Date.new(publish_date.to_i), publisher, cover_state, id)
      Genre.new(genre_name, genre_id).add_item(book)
      Author.new(author_first_name, author_last_name, author_id).add_item(book)
      Label.new(label_title, label_color, label_id).add_item(book)
      app.books << book
    end
  end

  def retrive_music_albums(app)
    file = read('music_albums.json')
    return if file.nil?

    file.each do |obj|
      id = obj['id']
      publish_date = obj['publish_date']
      on_spotify = obj['on_spotify']
      genre_id = obj['genre_id']
      genre_name = obj['genre_name']
      author_id = obj['author_id']
      author_first_name = obj['author_first_name']
      author_last_name = obj['author_last_name']
      label_id = obj['label_id']
      label_title = obj['label_title']
      label_color = obj['label_color']
      album = MusicAlbum.new(Date.new(publish_date.to_i), on_spotify, id)
      Genre.new(genre_name, genre_id).add_item(album)
      Author.new(author_first_name, author_last_name, author_id).add_item(album)
      Label.new(label_title, label_color, label_id).add_item(album)
      app.music_albums << album
    end
  end

  def retrieve_authors(app)
    file = read('authors.json')
    return if file.nil?

    file.each do |obj|
      id = obj['id']
      first_name = obj['first_name']
      last_name = obj['last_name']
      author = Author.new(first_name, last_name, id)
      app.authors << author
    end
  end

  def retrive_genres(app)
    file = read('genres.json')
    return if file.nil?

    file.each do |obj|
      id = obj['id']
      name = obj['name']
      genre = Genre.new(name, id)
      app.genres << genre
    end
  end

  def retrieve_labels(app)
    file = read('labels.json')
    return if file.nil?

    file.each do |obj|
      id = obj['id']
      title = obj['title']
      color = obj['color']
      label = Label.new(title, color, id)
      app.labels << label
    end
  end

  def retrieve_data(app)
    retrieve_books(app)
    retrive_music_albums(app)
    retrieve_games(app)
    retrieve_authors(app)
    retrieve_labels(app)
    retrive_genres(app)
  end

  def save_books(books)
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
    create_file(array, 'books.json')
  end

  def save_music_albums(albums)
    array = albums.map do |ele|
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
        on_spotify: ele.on_spotify
      }
    end
    create_file(array, 'music_albums.json')
  end

  def save_games(games)
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
    create_file(array, 'games.json')
  end

  def save_authors(authors)
    array = authors.map do |ele|
      {
        id: ele.id,
        first_name: ele.first_name,
        last_name: ele.last_name
      }
    end
    create_file(array, 'authors.json')
  end

  def save_genres(genres)
    array = genres.map do |ele|
      {
        id: ele.id,
        name: ele.name
      }
    end
    create_file(array, 'genres.json')
  end

  def save_labels(labels)
    array = labels.map do |ele|
      {
        id: ele.id,
        title: ele.title,
        color: ele.color
      }
    end
    create_file(array, 'labels.json')
  end

  def create_file(array, path)
    File.write(path, JSON.pretty_generate(array))
  end
end
