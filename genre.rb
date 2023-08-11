class Genre
  attr_accessor :items
  attr_reader :id, :name

  def initialize(name, id = nil)
    @id = id || rand(0..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self unless item.genre
  end
end
