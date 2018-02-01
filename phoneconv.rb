1. ## SHow phone number
2. ## validate number is 10 digits
3. ## delete dashes
4. ## delete parathesis
5. ## delete spaces
6. ## delete periods

a = "(256) 987-2648"
a.gsub!(/[!@%&"-- (a-z)]/,'')

puts a