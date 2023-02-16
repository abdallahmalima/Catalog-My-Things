require_relative '../item'

describe Item do
  before :each do
    @item = Item.new(606, '2011/02/02')
  end
  context 'Unit test for Item' do
    it 'should have the correct properties for Item' do
      expect(@item.id).to eql(606)
      expect(@item.publish_date).to eql('2011/02/02')
    end
  end

  context '#move_to_archive?' do
    it 'should return archived as true' do
      @item.move_to_archive?
      expect(@item.archived).to eql(true)
    end
  end

  describe '#can_be_archived?' do
    let(:item) { Item.new(101, '2012-01-01') }

    context 'when the method is called' do
      it 'returns true' do
        result = item.send(:can_be_archived?)
        expect(result).to be true
      end
    end
  end
end
