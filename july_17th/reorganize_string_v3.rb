# Input A array of n characters
# Output A array updated without repetitive characters if possible
#        else ""
#
# reorganize string is vaid if the number of different characters is less or equal to 1.
# for example if s contains n  letters a and m leters b with n - p == m being p > 1 the string can not being reorganize
# contrary    if s contains n  letters a and m leters b with n - p == m being 0 < p <  1 the string can be reorganize
#
# result = "" # we need this to store the resulting string
#
# loop until the original string is empty
#  for each char in the original string
#    find a valid position in the result (with no adjacents)
#    if a position is found
#       insert the char in result at the specified position
#       delete the char from the original string
#
#  if no char was deleted return ""
#
#return resul

def reorganize_string(s)

 result   = ""
 length_s = s.length

 until s.empty? do # im using so much .nil? just because .present didnt work :/
   length_s.times do |index|
p "result"
p result
     new_char = check_neighboor(s, new_char, index)

     result  += new_char unless new_char.nil?
     p result
   end
 end

 result
end

def check_neighboor(s, new_char, index)
p "!"
p index
p s
p s[index]
p s[index -1]
p"!"

   return s.shift  if (index == 0) || (s[0] != s[1])

   s.each do |index, ch|
     return index if s[0] != ch && s[0] != s[index + 1]
   end

   new_char = s.pop(index)
   p new_char
   new_char
end

a0 = "cxmwmmm".split("")
a1 = "ababa".split("")
a2 = "baaba".split("")
a3 = "vvvlo".split("")
a4 = "aaab".split("")
a5 = "bfrbs".split("")
a6 = "todrnphcamnomskfrhe".split("")
p  reorganize_string(a0)
#  reorganize_string(a1)
#  reorganize_string(a2)
#  reorganize_string(a3) #pending due to merge sort update for non n^2 array length
#  reorganize_string(a4)
#  reorganize_string(a5)
#  reorganize_string(a6)
