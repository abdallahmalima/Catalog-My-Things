require 'rspec'
require('./item')
require('./label')

describe Label do
  let(:label) { Label.new(1, 'Art', 'red') }
  let(:item) { Book.new(1, '2021-01-23', true, '2021-02-30', 'good') }

  describe '#initialize' do
    it 'initializes with an empty items array' do
      expect(label.instance_variable_get(:@items)).to eq([])
    end
  end

  describe '#add_item' do
    it 'adds an item to the items array' do
      label.add_item(item)
      expect(label.instance_variable_get(:@items)).to eq([item])
    end

    it 'sets the label attribute of the added item to the current label object' do
      label.add_item(item)
      expect(item.label).to eq(label)
    end
  end
end
