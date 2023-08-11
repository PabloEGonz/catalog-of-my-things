require_relative '../input'
require_relative '../label'

class LabelsHandler
  def initialize
    @input = Input.new
  end

  def add
    title = @input.getter('Enter a label name: ')
    color = @input.getter('Enter a label color: ')
    Label.new(title, color)
  end

  def list(labels)
    if labels.empty?
      puts 'There are not labels created yet'
    else
      labels.each_with_index do |label, i|
        puts "- #{i + 1}) Title: '#{label.title}, Color: #{label.color}"
      end
    end
  end
end
