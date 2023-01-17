class FileHandler

  def self.read_file
    File.open(ARGV[0], 'r')
  end

  def self.write_file
    File.new(ARGV[1], 'w+')
  end

  def self.count_english_characters
    count = read_file.read.gsub("\n", '').length
    count
  end

  def self.count_braille_characters
    count = read_file.read.gsub("\n", '').length / 6
    count
  end
end
