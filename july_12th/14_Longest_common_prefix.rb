#14. Longest Common Prefix
#
# Down in my implementation a recursive call to find the minimum length array can be simplified
# using:
#
# min = array.min { |x, y| x.size <=> y.size }
#
# Some useful gem to get the time excecution of a code:
#   require 'benchmark'
#   array = (1..100000).to_a.shuffle
#
#   Benchmark.bmbm(5) do |x|
#     x.report("lib:") { 99.times { min = array.min } }
#     x.report("own:") { 99.times { min = array[0]; array.each { |n| min = n if n < min } } }
#   end
#
# Write a function to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".
#
# @return {String}
def longest_common_prefix(strs)  #Runtime: 1792 ms, faster than 5.33% Memory Usage: 9.7 MB, less than 32.63%
    return strs[0] if strs.length == 1
    return ""      if strs.empty?

    prefix =""

    for i in 0..strs.length - 2 do
        for j in i + 1..strs.length - 1 do
            prefix = compare(strs[i],strs[j], prefix)

            return prefix if prefix == ""
        end
    end

    prefix
end

def compare(a,b,string)
    a = a.split("")
    b = b.split("")

    new_prefix   = ""

    search_limit = [a.length, b.length].min

    for i in 0..search_limit - 1 do
        a[i] == b[i] ? new_prefix += a[i] : break
    end

    return new_prefix if string == ""

    new_prefix.length >= string.length ? string :  new_prefix
end

def longest_common_prefix_2(strs)
    return strs[0] if strs.length == 1
    return ""      if strs.empty?

    min    = min_length(strs * 1)
    prefix = ""

    for i in 0..min-1 do
       comparison  = compare_2(strs *1, i)

       return prefix if comparison  == "0"

       prefix += comparison
    end

    prefix
end

def compare_2(string, i)
    word = string.pop

    if string == []
      return word[i]
    end

    return compare_2(string, i) == word[i]  ? word[i] : "0"
end

def min_length(string)
    word = string.pop

    return word.length if  string == []

    return [min_length(string), word.length].min
end

def longest_common_prefix_let_code(strs) # brilliant

 if strs.nil? || strs.empty?
   return ''
 end
 prefix = strs.min { |x, y| x.size <=> y.size }

 strs.each do |i|
   while i.index(prefix) != 0
       prefix = prefix[0...prefix.length-1]
     end
   end
 prefix
end

def longest_common_prefix(strs) # Runtime: 96 ms, faster than 5.35%
  longest_common_prefix_d_n_c(strs).first
end

def longest_common_prefix_d_n_c(strs)
  return strs   if strs.length == 1
  return [""]   if strs.empty?


  if strs.length > 2 && strs.length % 2 != 0
    aux = [strs.pop]

    half_1 = strs
    half_2 = aux
  else
    division = divide_2(strs)

    half_1 = division.first
    half_2 = division[1]
  end
  lcp(half_1, half_2)

  return lcp(longest_common_prefix_d_n_c(half_1), longest_common_prefix_d_n_c(half_2))
end

def lcp(x,y)
  return [] if x.empty?  || y.empty?

  min = min_length([x,y].flatten)

  result = ""

  for i in 0..min-1
    x.first[i] == y.first[i] ? result += x.first[i]  : break
  end

  [result]
end

def divide_2(strs)
    length = strs.length / 2

    half_1 = []

    for i in 0..length - 1  do
      half_1.push(strs.shift)
    end

    return half_1, strs
end

def min_length(string)
    word = string.pop

    return word.length if  string == []

    return [min_length(string), word.length].min
end

# @param {String[]} strs
# @return {String}
def longest_common_prefix_let_code_select(strs) # 52 ms, faster than 23.36%  BUTTT  Memory Usage: 10 MB, less than 13.75%
    return "" if strs.length == 0
    firstString = strs[0]
    longestString = ""
    curSubString = ""

    firstString.each_char do |char|
       curSubString << char

       filtered = strs.select do |curString|
           curString.index(curSubString) == 0
       end

       longestString = curSubString * 1 if filtered.length == strs.length
    end

    return longestString
end

def find_smallest_string(arr)
  smallest = arr[0].length
  result = nil
  arr.each do |str|
    if str.length < smallest || str.length == smallest
      result = str
      smallest = str.length
    end
  end
      return result
end

def longest_common_prefix_let_code(strs) # 40 ms, faster than 75.18%
   return "" if !strs || strs.empty?
  shortest_string = find_smallest_string(strs)
  shortest_string_length = shortest_string.length
  prefix = ""
  i = 0
  while i < shortest_string_length
  current = shortest_string[i]
  strs.each do |str|
    if str[i] != current
      return prefix
    else
      current = str[i]
    end
  end
    prefix.concat(current)
    i += 1
  end
  return prefix
end



# @param {String[]} strs
# @return {String}
def longest_common_prefix_match_solution(strs)
  return "" if strs.empty?
  i = 1
  match = strs[0]
  while i < strs.length
    until strs[i].index(match) == 0
      match.empty? ? break : nil
      match = match[0...-1]
    end
    i += 1
  end
  return match.nil? ? "" : match
end





def longest_common_prefix_winner(strs) #28 ms, faster than 98.54%  Take into acocunt the use of .all? here
  return '' if strs.empty?

  idx = 0
  prefix_count = 0

  while true
    curr_char = strs.first[idx]

    break if curr_char.nil?
    break unless strs.all? { |str| str[idx] == curr_char }

    prefix_count += 1
    idx += 1
  end

  return '' if prefix_count.zero?

  strs.first[0...prefix_count]
end



x =  ["aca", "cba"]

lcp(["hola"], ["ho"])
p longest_common_prefix_div_conq(d)
# p longest_common_prefix_let_code(c)
# p longest_common_prefix_2(c)
# p longest_common_prefix_2(d)
