require 'json'
require('./music_album')
require('./genre_repository')
class MusicAlbumRepository
  def initialize
    @music_albums = []
  end

  def all
    file = File.open('storage/music_album.json', 'r')
    data = file.read
    parsed_data = JSON.parse(data)

    parsed_data.each do |obj|
      @music_albums.push(
        MusicAlbum.new(obj['id'], obj['publish_date'], obj['archived'], obj['on_spotify'])
      )
    end
    @music_albums
  end

  def save(map)
    music_album = {
      'id' => Random.rand(1...1000),
      'publish_date' => map[:publish_date],
      'archived' => false,
      'on_spotify' => map[:on_spotify],
      'genre' => map[:genre].name
    }

    save_music_album(music_album)
    puts "\nMusic Album created successfully"
  end

  private

  def save_music_album(music_album)
    file = File.open('storage/music_album.json', 'r')
    data = file.read
    parsed_data = JSON.parse(data)

    parsed_data << music_album

    File.write('storage/music_album.json', JSON.pretty_generate(parsed_data))
  end
end
