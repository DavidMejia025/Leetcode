# Input A array of n characters
# Output A array updated without repetitive characters if possible
#        else ""
#
#
# Pseudo code
# start
# result = []
# do until i == a.length -2
# 1.compare a[i] with a[i+1] and find if they are equal
# 2. if 1 == true
#    i + = 1
#    go 1
# 3. if 1 == false
#    compare a[i] with [ai+2]
# 4. if 3 == true
#    break
#    if 3 == false
# 5. a[1+1] = a[i+2] && a[i+2] == a[i+1]
#    i += 1
#    go 1
# end
# 6. if result.length == a.length - 2
# 7. if compare a[i] with a[i+1] and find if they are equal
#    if 7 true
#      break
#    if 7 == false
#      result.push(a[i-1])
#      result.push(a[i])
#  return result
#
#  pseudo code upper level
#
#  until i < a.length - 2
#    1. compare a[i] == a[i+1]
#    if 1 == true
#       2. find next  char != a[i] and replace a[i+1]
#       3. compare a[i] == a[i+1]
#       if 3 == true
#         break
#       else
#         i + = 1
#         next
#       end
#    else
#       i += 1
#    end
#  end
#
#  validate last two characters
def reorganize_string(a)
  length_a = a.length

  return a if length_a == 1

  (length_a - 2).times do |index|
    a = compare_characters(0,a, index * 1)

    return a if a.empty?
  end

  return [""]  if a[-2] == a[-1]

  a
#  a = compare_characters(1,0, length_a - 2)
end

def compare_characters(type, a, index)
  if type == 1
   return  a[index] == a[index + 1] ? [""]  : a
  else
    if a[index] == a[index + 1]
      a = change_characters(a, index)
      return  [""] if a == [""]

      return  compare_characters(1, a, index)
    else
      return a
    end
  end
end

def change_characters(a, index)
  length_change = a.length - index

  aux_char  = a[index + 1]
  aux_index = index + 1

  length_change.times do |i|
    second_index = i + 1 + index

    if a[index] != a[second_index]
     aux_char  = a[second_index]
     aux_index = second_index
     break
    end

    p i
  end

  return [""] if aux_char == a[index + 1]

  a[aux_index] = a[index + 1]
  a[index + 1] = aux_char
  a
end

a0 = ["a", "a", "a","b","a"]
a1 = ["a","a", "a","a", "a", "a","b", "b", "b", "b","c", "c", "c", "c","d", "d", "d", "d"]
a2 = ["a", "a","a","a","b","b","b","c","c","c","d","d","d"]
b =  ["b","b","b","b","b","b","b"]
#p"!!"
#p a1.count
#p"!!!"
#p reorganize_string(a0)
#p reorganize_string(a2)
#p reorganize_string(a1).count
#p reorganize_string(a1)
# p reorganize_string(b)
# p reorganize_string(["b","b","b"])
# p reorganize_string(["b","b","b"])
#


# Other alternative taking into account the following rule:
# reorganize string is vaid if the number of different characters is less or equal to 1.
# for example if s contains n  letters a and m leters b with n - p == m being p > 1 the string can not being reorganize
# contrary    if s contains n  letters a and m leters b with n - p == m being 0 < p <  1 the string can be reorganize
#
# Pseudo code:
# 1. sort array
# 2. count the number of different elements
# 3. verify rule
#    if rule == true
# 4. build new array
#    else
#      retun ""
# end
#
#
def reorganize_string(a)
  a.sort!
  p a
  count = count_by_character(a)
p count
  can_reorganize?(count)
end

def can_reorganize?(count)
  max = count.max
  sum = count.reduce(&:+)

  return false  if max == sum

  max - (sum - max) <= 1
end

def count_by_character(a)
  length_a = a.length

  result = []
  count  = 1
  ref   = a[0]

  length_a.times do |i|
     if a[i] == a[i + 1]
       count += 1
     else
       result.push(count)
       ref = a[i+1]
       count = 1
     end
  end

  result
end

a0 = "cxmwmmm".split("")
a1 = "ababa".split("")
p reorganize_string(a1)
