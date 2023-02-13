class Item
  attr_reader id, publish_date, archived
  attr_accessor genre, author, label

  def intialize(id, publish_date, archived)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end
end
