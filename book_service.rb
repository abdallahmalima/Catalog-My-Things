require('./book_repository')
require('./label_service')

class BookService
  def initialize()
    @book_repository = BookRepository.new
    @label_service = LabelService.new
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
    print "\nPlease select The label:\n"
    labels = @label_service.index
    print "0)Create a new label:\n"

    label_index = gets.chomp.to_i
    my_label = labels[label_index - 1]
    my_label = @label_service.create if label_index.zero?
    book_map = { publish_date: publish_date,
                 publisher: publisher,
                 cover_state: cover_state,
                 label: my_label }

    @book_repository.save(book_map)
  end
end
