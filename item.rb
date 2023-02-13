class Item
  attr_reader :id, :publish_date, :archived
  attr_accessor :genre, :author, :label

  def intialize(id, publish_date, archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  private

  def can_be_archived?
    @publish_date > 10
  end

  public

  def move_to_archive?
    @archived = true if can_be_archived?
  end
end
