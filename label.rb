class Label
  def initialize()
    @items = []
  end

  def add_item(item)
    item.label = self
    @items.push(item)
  end
end
