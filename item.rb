require 'date'
class Item
  attr_reader :id, :publish_date, :archived
  attr_accessor :genre, :author, :label

  def initialize(id, publish_date, archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  private

  def can_be_archived?
    (Date.today.year - Date.parse(@publish_date).year).to_i > 10
  end

  public

  def move_to_archive?
    @archived = true if can_be_archived?
  end
end
