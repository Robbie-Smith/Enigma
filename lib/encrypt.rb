require_relative 'encryptor'
# read_from = ARGV[0]
# encrypt_to = ARGV[1]
#
# input = File.read(read_from)
#
# e = Encryptor.new
#
# encrypted_text = e.encrypt(input)
#
# output = File.write(encrypt_to, encrypted_text)
#
# p encrypted_text

# input_file = ARGV[0]
#
# message = File.read(input_file)
# e = Encryptor.new
# message = e.encrypt(message)
# output_file = ARGV[1]
# File.write(output_file, encrypted)
# puts "Created #{output_file} with the key #{e.key}"

file_to_read = ARGV[0]
file_to_write = ARGV[1]

message = File.read(file_to_read)

e = Encryptor.new(message)

new_message = e.encrypt(message)


File.write(file_to_write, new_message)
puts "Created #{file_to_write}"

# ruby ./lib/encryptor.rb message.txt encrypted.txt
