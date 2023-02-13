def menu(inputs)
  puts inputs
  choice=gets.chomp.to_i
  case choice
  when 1
   puts "all books"
  when 2
    puts "all music albums"
  when 3
    puts "all games"
  when 4
    puts "all genres"
  when 5
    puts "all labels"
  when 6
    puts "all authors"
  when 7
    puts "Add Book Selected"
  when 8
    puts "Add Music Album Selected"
  when 9
    puts "Add Game Selected"
  when 10
    return false
  else
    puts 'Please enter a valid input'
  end
  true
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
    puts "Thanks for using our application"

end

main
