require_relative 'translator'
require_relative 'file_handler'

translator = Translator.new

read_file = FileHandler.read_file
write_file = FileHandler.write_file

translation = translator.formatted_braille_conversion(FileHandler.read_file.read)
write_file.write(translation)
