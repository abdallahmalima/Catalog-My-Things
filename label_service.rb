require('./label_repository')
class LabelService
  def initialize()
    @label_repository = LabelRepository.new
    @labels = @label_repository.all
  end

  def index
    if @labels.length.eql?(0)
      puts 'There is no books '
    else
      count = 1

      @labels.each do |label|
        puts "#{count}) ID: \"#{label.id}\", " \
             "Title: #{label.title}, " \
             "Color: #{label.color}, "
        count += 1
      end
    end
  end

  def create
    print 'Title:'
    title = gets.chomp
    print "\nColor:"
    color = gets.chomp

    label_map = { title: title,
                  color: color }
    @label_repository.save(label_map)

    Label.new(1, title, color)
  end
end
