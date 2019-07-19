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
 result   = []

 until s.empty? do
  result =  add_one_character(s, result)
  break if result == [""]
 end

 result
end

# Manual test add_one_character
# xwvmm
# s         mm
# result   xwv
# s[0]     m
# ch       x
# i        0
# index    0
# new_char m
# result   x.push(m) + wv
#
# s m
# result   xmwv


def add_one_character(s, result)
  return result.push(s.shift)  if (s.length != 1) && (s[0] != s[1])

  index = -1

  result.each_with_index do |ch, i|
    return result.unshift(s.shift) if i == 0 && s[0] != ch

    index = i if s[0] != ch && s[0] != result[i + 1]
  end

  return [""] if index == -1

  new_char = s.shift

  return result[0..index].push(new_char) + result[index + 1..-1]
end
def adjacent_chars(str)
  result = ""

  remaining = str.split("")
  until remaining.empty?
    at_least_one_removed = false
    remaining.delete_if do |c|
      pos = find_valid_position(result, c)
      if pos != -1
        result.insert(pos, c)
        at_least_one_removed = true
        true # delete char
      else
        false # don't delete char
      end
    end

    return "" unless at_least_one_removed
  end

  return result
end

def find_valid_position(str, c)
  return 0 if str.empty?

  for i in 0...str.length
    if i == 0 && str[0] != c
      return 0
    elsif i == str.length - 1 && str[i] != c
      return str.length
    elsif str[i] != c && str[i+1] != c
      return i + 1
    end
  end

  return -1
end





a0 = "cxmwmmm".split("")
a1 = "ababa".split("")
a2 = "baaba".split("")
a3 = "vvvlo".split("") # fucked another boring edge case.
a4 = "aaab".split("")
a5 = "bfrbs".split("")
a6 = "todrnphcamnomskfrhe".split("")
#  reorganize_string(a0)
#  reorganize_string(a1)
#  reorganize_string(a2)
#  reorganize_string(a3) #pending due to merge sort update for non n^2 array length
#  reorganize_string(a4)
#  reorganize_string(a5)
#  reorganize_string(a6)

p adjacent_chars("bbbbaaaaababaababab")
p adjacent_chars("aaab")

p adjacent_chars(a0.join)
p adjacent_chars(a1.join)
p adjacent_chars(a2.join)
p adjacent_chars(a3.join)
p adjacent_chars(a4.join)
p adjacent_chars(a5.join)
p adjacent_chars(a6.join)
