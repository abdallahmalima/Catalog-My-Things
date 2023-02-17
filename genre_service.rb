require('./genre_repository')
class GenreService
  def initialize()
    @genre_repository = GenreRepository.new
    @genres = @genre_repository.all
  end

  def index
    if @genres.length.eql?(0)
      puts 'There is no genres '
    else
      count = 1

      @genres.each do |genre|
        puts "#{count}) ID: \"#{genre.id}\", " \
             "Name: #{genre.name}"
        count += 1
      end
    end
  end

  def create
    print 'Name:'
    name = gets.chomp

    genre_map = { name: name }
    @genre_repository.save(genre_map)

    Genre.new(1, name)
  end
end
