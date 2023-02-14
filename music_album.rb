require('./item')
class MusicAlbum < Item
  def intialize(id, publish_date, archived: false, on_spotify: false)
    super(id, publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  private :can_be_archived?
end
