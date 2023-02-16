require 'json'
require('./game_store')
require('./author_display')

class GameDisplay
  def initialize
    @game_display = GameStore.new
    @game_show = @game_display.fetch_all
    @author = AuthorDisplay.new
  end

  def index
    if @game_show.length.eql?(0)
      puts 'There are no games!!'
    else
      count = 0
      @game_show.each do |game|
        puts "#{count}) ID: \"#{game.id}\", " \
             "publish_date: #{game.publish_date}, " \
             "multiplayer: #{game.multiplayer}, " \
             "last_played_at: #{game.last_played_at}, "
        count += 1
      end
    end
  end

  def create
    puts 'Publish date:'
    publish_date = gets.chomp
    puts 'Multiplayer:'
    multiplayer = gets.chomp
    puts 'last_played_at (input date as: yyyy-mm-dd):'
    last_played_at = gets.chomp
    puts 'Please select an Author'
    author = @author.index
    puts '0) Create an author:'
    author_index = gets.chomp.to_i
    my_author = author[author_index - 1] if author_index.positive?
    my_author = @author.create if author_index.zero?
    game_map = {
      publish_date: publish_date,
      multiplayer: multiplayer,
      last_played_at: last_played_at,
      author: my_author
    }
    @game_display.save(game_map)
  end
end
