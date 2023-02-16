require 'json'
require './game'

class GameStore
  def initialize
    @game = []
  end

  def fetch_all
    file = File.open('./storage/game.json', 'r')
    read_file = file.read

    parse_file = JSON.parse(read_file)

    parse_file.each do |k|
      @game.push(Game.new(k['id'], k['publish_date'], k['archived'], k['multiplayer'], k['last_played_at']))
    end

    @game
  end

  def save(map)
    game = {
      'id' => Random.rand(1...1000),
      'publish_date' => map[:publish_date],
      'archived' => false,
      'multiplayer' => map[:multiplayer],
      'last_played_at' => map[:last_played_at],
      'author' => map[:author].first_name
    }
    save_game(game)
    puts 'Game created successfully'
  end

  def save_game(game)
    file = File.open('./storage/game.json', 'r')
    read_file = file.read
    parse_file = JSON.parse(read_file)

    parse_file << game


    File.write('./storage/game.json', JSON.pretty_generate(parse_file))
  end
end
