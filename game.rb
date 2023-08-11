require_relative 'item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at, id = nil)
    super(publish_date, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    now = Date.today
    before = Date.parse(publish_date.to_s)
    difference = (now - before).to_i
    difference_year = difference / 365
    super && difference_year > 2
  end
end
