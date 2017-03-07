#### Enigma

The goal of this project was to recreate the German Enigma machine and to
implement Alan Turing's infamous crack.

To use:

`$ git clone https://github.com/Robbie-Smith/Enigma.git`

`$ cd engima`

Create a txt file that contains a message that you would like to encrypted

`$ ruby lib/encrypt.rb <name of the txt file> <name of the encrypted file>`

Example: `$ ruby lib/encrypt.rb message.txt encrypt.txt`

You should then see the encrypted message print to the screen with the code that
you would need to decrypt the message.

`$ ruby lib/decrypt.rb <name of the encrypted file> <name of decrypted file>
<key>`

Example: `$ ruby lib/decrypt.rb encrypted.txt decrypted.txt 56676825`

You should then see the decrypted text print to the screen
