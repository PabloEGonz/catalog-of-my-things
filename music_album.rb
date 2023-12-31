require_relative 'item'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify, id = nil)
    super(publish_date, id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
