@user_input = ARGV 

file_path = File.read(ARGV[0])
new_file = File.new(ARGV[1], 'w+')

new_file.write(file_path.reverse)


new_file.close
