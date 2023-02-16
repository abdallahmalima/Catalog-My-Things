require('./music_album_repository')
require('./genre_service')

class MusicAlbumService
  def initialize()
    @music_album_repository = MusicAlbumRepository.new
    @genre_service = GenreService.new
    @music_albums = @music_album_repository.all
  end

  def index
    if @music_albums.length.eql?(0)
      puts 'There is no music album '
    else
      count = 0
      @music_albums.each do |music_album|
        puts "#{count}) ID: \"#{music_album.id}\", " \
             "Publish Date: #{music_album.publish_date}, " \
             "On_Spotify: #{music_album.on_spotify}"
        count += 1
      end
    end
  end

  def create
    print 'Publish date:'
    publish_date = gets.chomp
    print "\nOn_Spotify (true / false):"
    on_spotify = gets.chomp
    on_spotify = spotify_choice(on_spotify)
    if on_spotify == 'Invalid'
      puts 'Invalid input'
      return
    end
    print "\nPlease select the genre:\n"
    genres = @genre_service.index
    print "0)Create a new genre:\n"

    genre_index = gets.chomp.to_i
    my_genre = genres[genre_index - 1] if genres.length.positive?
    my_genre = @genre_service.create if genre_index.zero?
    music_album_map = { publish_date: publish_date,
                        on_spotify: on_spotify,
                        genre: my_genre }

    @music_album_repository.save(music_album_map)
  end

  def spotify_choice(choice)
    case choice
    when 'true'
      true
    when 'false'
      false
    else
      'Invalid'
    end
  end
end
