require('./item')

class MusicAlbum < Item
  def initialize(id, publish_date, archived, on_spotify)
    super(id, publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  private :can_be_archived?
end
