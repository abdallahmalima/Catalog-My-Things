require './author_store'

class AuthorDisplay
  def initialize
    @display_author = AuthorStore.new
    @fetch_data = @display_author.fetch_all
  end

  # One function to display the data which is stored
  def index
    if @fetch_data.length.eql?(0)
      puts 'There is no Author'
    else
      count = 1
      @fetch_data.each do |author|
        puts "#{count}) ID: #{author.id}, first name: #{author.first_name}, last name: #{author.last_name} "
        count += 1
      end
    end
  end

  # Another function to create the data
  def create
    puts 'Authors first name:'
    first_name = gets.chomp
    puts 'Authors last name:'
    last_name = gets.chomp
    author = {
      first_name: first_name,
      last_name: last_name
    }
    @display_author.save(author)
    Author.new(1, first_name, last_name)
  end
end
