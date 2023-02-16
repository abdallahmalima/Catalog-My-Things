require('./music_album_service')
require('./genre_service')
require('./game_display')
require('./author_display')
require('./book_service')
require('./label_service')

def menu(inputs)
  game_display = GameDisplay.new
  author_display = AuthorDisplay.new
  book_service = BookService.new
  label_service = LabelService.new
  music_album_service = MusicAlbumService.new
  genre_service = GenreService.new
  puts inputs
  options_map = { game_display: game_display,
                  author_display: author_display,
                  book_service: book_service,
                  label_service: label_service,
                  music_album_service: music_album_service,
                  genre_service: genre_service }
  options(options_map)
end

def main
  puts "\nWelcome to Catalog of my things!\n"
  inputs =
    "\nPlease select an option by entering the number:\n" \
    "1 - List all books\n" \
    "2 - List all music albums\n" \
    "3 - List all games\n" \
    "4 - List all genres\n" \
    "5 - List all labels\n" \
    "6 - List all authors\n" \
    "7 - Add a book\n" \
    "8 - Add a music album\n" \
    "9 - Add a game\n" \
    "10 - Exit\n"

  flag = true
  flag = menu(inputs) while flag
  puts 'Thanks for using our application'
end

# rubocop:disable Metrics/CyclomaticComplexity
def options(options_map)
  choice = gets.chomp.to_i
  case choice
  when 1 then options_map[:book_service].index
  when 2 then options_map[:music_album_service].index
  when 3 then options_map[:game_display].index
  when 4 then options_map[:genre_service].index
  when 5 then options_map[:label_service].index
  when 6 then options_map[:author_display].index
  when 7 then options_map[:book_service].create
  when 8 then options_map[:music_album_service].create
  when 9 then options_map[:game_display].create
  when 10 then return false
  else
    puts 'Please enter a valid input'
  end
  true
end
# rubocop:enable Metrics/CyclomaticComplexity
main
