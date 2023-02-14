class Genre
  attr_accessor :id, :name
  attr_reader :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []

    private :id, :items
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
