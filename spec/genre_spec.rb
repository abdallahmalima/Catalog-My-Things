require_relative '../genre'
require_relative '../music_album'

describe Genre do
  before :each do
    @genre = Genre.new(101, 'Pop')
  end
  context 'Unit test for Genre' do
    it 'should have the correct properties for genre' do
      expect(@genre.id).to eql(101)
      expect(@genre.name).to eql('Pop')
    end

    it 'should return the total number of items' do
      item = MusicAlbum.new(101, '2020/01/01', false, true)
      @genre.add_item(item)
      @genre.add_item(item)
      expect(@genre.items.length).to eql 2
    end
  end
end
