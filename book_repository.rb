require 'json'
require('./book')
require('./label_repository')
class BookRepository
  def initialize
    @books = []
  end

  def all
    file = File.open('storage/books.json', 'r')
    data = file.read
    parsed_data = JSON.parse(data)

    parsed_data.each do |obj|
      @books.push(
        Book.new(obj['id'], obj['publish_date'], obj['archived'], obj['publisher'], obj['cover_state'])
      )
    end
    @books
  end

  def save(map)
    book = {
      'id' => Random.rand(1...1000),
      'publish_date' => map[:publish_date],
      'archived' => false,
      'publisher' => map[:publisher],
      'cover_state' => map[:cover_state],
      'label' => map[:label].title
    }

    save_book(book)
    puts "\nBook created successfully"
  end

  private

  def save_book(book)
    file = File.open('storage/books.json', 'r')
    data = file.read
    parsed_data = JSON.parse(data)

    parsed_data << book

    File.write('storage/books.json', JSON.pretty_generate(parsed_data))
  end
end
