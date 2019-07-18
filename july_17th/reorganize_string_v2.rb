# Input A array of n characters
# Output A array updated without repetitive characters if possible
#        else ""
#
# reorganize string is vaid if the number of different characters is less or equal to 1.
# for example if s contains n  letters a and m leters b with n - p == m being p > 1 the string can not being reorganize
# contrary    if s contains n  letters a and m leters b with n - p == m being 0 < p <  1 the string can be reorganize
#
# Pseudo code:
# (1). sort array
# (2). count the number of different elements
# (3). verify rule
#      if  (3) is true
# (4).   sort_by_count
#       else
#        return ""
# (5). build new array
# end
#
# sort_by_count
# (1)  take the first
#
def reorganize_string(a)
p a
  a = get_frequencies(a)

  count = count_char_numbers(a)

  return "" unless can_reorganize?(count)

  build_new_string(a, count)
end

#Suiteble for lambda?
def count_char_numbers(a)
  a.reduce([]){|accu, ch| accu.push(ch.values[0])}
end
# input: array[string] n elements
# output: the frequencies of ocurrence of each character in format {"char": number(0)}
# Pseudo code
# Given an array A
# (1). for each element count the number of occurrences and store the value in key pair
#      select values of char == element_i of A
#      count the number of the selection
#      store the value
#      reject from A char == element_i A
#
# Following previews pseudo code I got this solution but maybe the previews one can be done recursevily
# in a divede and conquer fashion ? (that will lead to better running time
#
def get_frequencies(array)
  length_array = array.length
  new_array = []
  index = 1

  while  index <= length_array + 1

    char = array[0]

    count_char = array.select{|ch| ch == char}

    array.reject!{|ch| ch == char}
    new_array.push({"#{char}" => count_char.length})

    index += 1
  end

  g = new_array.reject{|char| char.values[0] == 0} #this need to be improved to avoide the last reject step
end

def can_reorganize?(count)
  max = count.max
  sum = count.reduce(&:+)

  return false  if max == sum

  max - (sum - max) <= 1
end

#pseudo code
# (1). find the higher  key value
#      assing to high the hash with higher valuee
# (2). find the next higher key value
#      assign to low the hash with to the next higher value
# (3). while any values in A different from zero do:
#      (4). empty high alternating with low
#      (5). if high value is equal to 0 (1)
#      (6). if low value is equal to 0 (2)
#
#

def build_new_string(a, count)
  g_value   = lambda {|h| [h.keys[0]][0]}
  high_char = find_higher(a)
  low_char  = find_low(a * 1, high_char)

  result = []
  k      = 1

  while k <= count.reduce(&:+)  #a.any?{|values| a.values[0] != 0}
    if k.odd?
      result.push(high_char.keys[0])
      high_char[g_value.call(high_char)] = high_char.values[0] - 1
    else
      result.push(low_char.keys[0])
      low_char[g_value.call(low_char)] = low_char.values[0] - 1
    end

    high_char = find_higher(a)            if high_char.values[0] == 0
    low_char = find_low(a * 1, high_char) if low_char.values[0] == 0

    k += 1
  end

  result
end

def find_higher(a)
  max = count_char_numbers(a).max

  a.select{|ch| ch.values[0] == max}[0]
end

def find_low(a, high)
  a.reject!{|ch| ch == high}

  find_higher(a)
end
a0 = "cxmwmmm".split("")
a1 = "ababa".split("")
a2 = "baaba".split("")
a3 = "vvvlo".split("")
a4 = "aaab".split("")
a5 = "bfrbs".split("")
a6 = "todrnphcamnomskfrhe".split("")
p  reorganize_string(a0)
p  reorganize_string(a1)
p  reorganize_string(a2)
p  reorganize_string(a3) #pending due to merge sort update for non n^2 array length
p  reorganize_string(a4)
p  reorganize_string(a5)
p  reorganize_string(a6)
