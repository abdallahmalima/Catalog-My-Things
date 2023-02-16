class Label
  attr_accessor :title, :color
  attr_reader :id

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self
    @items.push(item)
  end
end
