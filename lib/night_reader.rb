require_relative 'translator'
require_relative 'file_handler'

translator = Translator.new

read_file = FileHandler.read_file
write_file = FileHandler.write_file

translation = translator.convert_to_english(FileHandler.read_file.read)
write_file.write(translation)

puts " Created #{ARGV[1]} containing #{FileHandler.count_braille_characters} characters."