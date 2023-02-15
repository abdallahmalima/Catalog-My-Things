require_relative '../music_album'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new(777, '2020/02/02', true, false)
  end
  context 'Unit test for MusicAlbum' do
    it 'should have the correct properties for MusicAlbum' do
      expect(@music_album.id).to eql(777)
      expect(@music_album.publish_date).to eql('2020/02/02')
      expect(@music_album.archived).to eql(true)
      expect(@music_album.on_spotify).to eql(false)
    end
  end

  describe '#can_be_archived?' do
    let(:album) { MusicAlbum.new(101, '2012-01-01', true, true) }

    context 'when the album is on Spotify' do
      it 'returns true' do
        result = album.send(:can_be_archived?)
        expect(result).to be true
      end
    end
  end
end
