require 'json'
require('./genre')
class GenreRepository
  def initialize
    @genres = []
  end

  def all
    file = File.open('storage/genres.json', 'r')
    data = file.read
    parsed_data = JSON.parse(data)

    parsed_data.each do |obj|
      @genres.push(
        Genre.new(obj['id'], obj['name'])
      )
    end
    @genres
  end

  def save(map)
    genre = {
      'id' => Random.rand(1...1000),
      'name' => map[:name]
    }
    save_genre(genre)
    puts "\nGenre created successfully"
  end

  private

  def save_genre(genre)
    file = File.open('storage/genres.json', 'r')
    data = file.read
    parsed_data = JSON.parse(data)

    parsed_data << genre

    File.write('storage/genres.json', JSON.pretty_generate(parsed_data))
  end
end
