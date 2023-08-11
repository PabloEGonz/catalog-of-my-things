require_relative 'item'

class Label
  attr_reader :id, :title, :color, :items

  def initialize(title, color, id = nil)
    @id = id || Random.rand(0..1000)
    @items = []
    @title = title
    @color = color
  end

  def add_item(item)
    @items << item if @items.include?(item) == false
    item.label = self
  end
end
