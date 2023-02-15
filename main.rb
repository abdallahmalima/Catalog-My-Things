# rubocop:disable Metrics/CyclomaticComplexity
require('./book_service')
require('./label_service')
def menu(inputs)
  book_service = BookService.new
  label_service = LabelService.new
  puts inputs
  choice = gets.chomp.to_i
  case choice
  when 1 then book_service.index
  when 2 then puts 'all music albums'
  when 3 then puts 'all games'
  when 4 then puts 'all genres'
  when 5 then label_service.index
  when 6 then puts 'all authors'
  when 7 then book_service.create
  when 8 then puts 'Add Music Album Selected'
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
