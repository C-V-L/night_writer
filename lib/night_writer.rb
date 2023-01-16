require_relative 'braille_translator'

@user_input = ARGV 

translator = BrailleTranslator.new

read_message = File.read(ARGV[0])
new_file = File.new(ARGV[1], 'w+')
# require 'pry'; binding.pry
translation = translator.formatted_braille_conversion(read_message)
new_file.write(translation)
puts "Created #{ARGV[1]} containing #{read_message.length} characters"

new_file.close
