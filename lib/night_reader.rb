@user_input = ARGV 

file_path = File.open(ARGV[0], 'r')
new_file = File.new(ARGV[1], 'w')

new_file.write(file_path.read.downcase)
new_file.close