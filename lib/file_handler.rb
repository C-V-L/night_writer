class FileHandler

  def self.read_file
    File.open(ARGV[0], 'r')
  end

  def self.write_file
    File.new(ARGV[1], 'w+')
  end

  def self.count_incoming_characters
    count = read_file.read.gsub("\n", '').length
    count
  end

end

# require_relative 'translator'

# @user_input = ARGV 

# translator = Translator.new

# read_message = File.read(ARGV[0])
# new_file = File.new(ARGV[1], 'w+')

# translation = translator.formatted_braille_conversion(read_message)
# new_file.write(translation)
# p "Created #{ARGV[1]} containing #{read_message.length} characters"

# new_file.close
