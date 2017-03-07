require './lib/decryptor'
read_from = ARGV[0]
decrypt_to = ARGV[1]
key = ARGV[2]

input = File.read(read_from)

e = Decryptor.new

decrypted_text = e.decrypt(input, key)

File.write(decrypt_to, decrypted_text)

p decrypted_text
