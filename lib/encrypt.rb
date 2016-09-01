require './lib/encryptor'

read_from = ARGV[0]
encrypt_to = ARGV[1]

input = File.read(read_from)

e = Encryptor.new

encrypted_text = e.encrypt(input)

output = File.write(encrypt_to, encrypted_text)

p encrypted_text
