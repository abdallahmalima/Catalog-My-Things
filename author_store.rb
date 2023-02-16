require 'json'
require './author'

class AuthorStore
  def initialize
    @author = []
  end

  def fetch_all
    file = File.read('./storage/author.json')
    parsed_file = JSON.parse(file)
    parsed_file.each do |k|
      @author.push(
        Author.new(k['id'], k['first_name'], k['last_name'])
      )
    end
    @author
  end

  def save(map)
    author_details = {
      'id' => Random.rand(1...1000),
      'first_name' => map[:first_name],
      'last_name' => map[:last_name]
    }
    show_saved(author_details)

    puts 'Author created successfully'
  end

  def show_saved(author_details)
    file = File.read('./storage/author.json')
    parsed_file = JSON.parse(file)

    parsed_file << author_details

    File.write('./storage/author.json', JSON.pretty_generate(parsed_file))
  end
end
