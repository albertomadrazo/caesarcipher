def encrypt(x, char_number, level)
	letra_encriptada = char_number - x[0]
	letra_encriptada += level
	letra_encriptada %= x[1]
	letra_encriptada += x[0]

	letra_encriptada.chr
end

def converter (word, level)
	it_uppercase = [65, 26]
	it_lowercase = [97, 26]
	it_number    = [47, 10]

	encrypted_string = "" # Strings are mutable in Ruby
	text_to_array = word.split("")

	text_to_array.each_with_index do |letter, index|
		char_number = letter.ord

		if char_number > 96 and char_number < 123
			encrypted_letter = encrypt(it_lowercase, char_number, level)
			encrypted_string[index] = encrypted_letter.chr	

		elsif char_number > 65 and char_number < 91
			encrypted_letter = encrypt(it_uppercase, char_number, level)
			encrypted_string[index] = encrypted_letter.chr
			# encrypted_letter.chr	

		elsif char_number > 47 and char_number < 58
			encrypted_letter = encrypt(it_number, char_number, level)
			encrypted_string[index] = encrypted_letter.chr
			# encrypted_letter.chr	

		else 
			encrypted_string[index] = letter

		end
	end
	encrypted_string
end

# def converter (letra, level)
# 	it_uppercase = [65, 26]
# 	it_lowercase = [97, 26]
# 	it_number    = [47, 10]
# 	char_number = letra.ord

# 	if char_number > 96 and char_number < 123
# 		encrypted_letter = encrypt(it_lowercase, char_number, level)
# 		encrypted_letter.chr

# 	elsif char_number > 65 and char_number < 91
# 		encrypted_letter = encrypt(it_uppercase, char_number, level)
# 		encrypted_letter.chr

# 	elsif char_number > 47 and char_number < 58
# 		encrypted_letter = encrypt(it_number, char_number, level)
# 		encrypted_letter.chr

# 	else 
# 		letra

# 	end

# end

def main
	print "Write a text: "
	user_input = STDIN.gets.chomp
	if /[a-zA-Z0-9\s\.]+/.match(user_input) == nil
		puts "Use only English letters, numbers and spaces."
	end
	print "encryption level: "
	level = STDIN.gets.chomp.to_i
	# encrypted_string = ""	

	# text_to_array = user_input.split("")

	encrypted_string = converter(user_input, level)
	# text_to_array.each_with_index do |letter, index|
		# encrypted_string[index] = converter(letter, level)
	# end	

	puts "The encrypted text is: "
	puts encrypted_string
end
