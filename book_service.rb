require('./book_repository')
class BookService
  def initialize()
    @book_repository = BookRepository.new
    @books = @book_repository.all
  end

  def index
    if @books.length.eql?(0)
      puts 'There is no books '
    else
      count = 0
      @books.each do |book|
        puts "#{count}) ID: \"#{book.id}\", " \
             "Publish Date: #{book.publish_date}, " \
             "Publisher: #{book.publisher}, " \
             "Cover State: #{book.cover_state}"
        count += 1
      end
    end
  end

  def create
    print 'Publish date:'
    publish_date = gets.chomp
    print "\nPublisher:"
    publisher = gets.chomp
    print "\nCover State:"
    cover_state = gets.chomp
    book_map = { publish_date: publish_date,
                 publisher: publisher,
                 cover_state: cover_state }
    @book_repository.save(book_map)
  end
end
