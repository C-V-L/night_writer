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

  def self.count_outgoing_characters
    count = read_file.read.gsub("\n", '').length / 6
    count
  end
end
