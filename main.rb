# rubocop:disable Metrics/CyclomaticComplexity
require('./music_album_service')
require('./genre_service')
def menu(inputs)
  music_album_service = MusicAlbumService.new
  genre_service = GenreService.new
  puts inputs
  choice = gets.chomp.to_i
  case choice
  when 1 then puts 'all books'
  when 2 then music_album_service.index
  when 3 then puts 'all games'
  when 4 then genre_service.index
  when 5 then puts 'all labels'
  when 6 then puts 'all authors'
  when 7 then puts 'Add Book Selected'
  when 8 then music_album_service.create
  when 9 then puts 'Add Game Selected'
  when 10 then return false
  else
    puts 'Please enter a valid input'
  end
  true
end

# rubocop:enable Metrics/CyclomaticComplexity

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

main
