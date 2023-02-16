require 'json'
require('./label')
class LabelRepository
  def initialize
    @labels = []
  end

  def all
    file = File.open('storage/labels.json', 'r')
    data = file.read
    parsed_data = JSON.parse(data)

    parsed_data.each do |obj|
      @labels.push(
        Label.new(obj['id'], obj['title'], obj['color'])
      )
    end
    @labels
  end

  def save(map)
    label = {
      'id' => Random.rand(1...1000),
      'title' => map[:title],
      'color' => map[:color]
    }
    save_label(label)
    puts "\nLabel created successfully"
  end

  private

  def save_label(label)
    file = File.open('storage/labels.json', 'r')
    data = file.read
    parsed_data = JSON.parse(data)

    parsed_data << label

    File.write('storage/labels.json', JSON.pretty_generate(parsed_data))
  end
end
