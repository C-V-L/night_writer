require_relative 'translator'

@user_input = ARGV 

translator = Translator.new

read_message = File.read(ARGV[0])
new_file = File.new(ARGV[1], 'w+')

translation = translator.convert_to_english(read_message)
new_file.write(translation)
puts "Created #{ARGV[1]} containing #{(read_message.length / 6)} characters"
new_file.close

