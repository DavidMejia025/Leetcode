# My solution 44 ms - 32 ms
 def to_lower_case(str)
    str.split.map {|word| word.downcase }.join
 end

# other solution
# https://apidock.com/ruby/Array/zip tricky very tricky
def to_lower_case1(str)
  char_map = Hash[('A'..'Z').zip ('a'..'z')]
    str.each_char.with_index do |c, i|
      if char_map.key?(c)
        str[i] = char_map[c]
      end
    end
  str
end

# Why is this so fast? 24 - 28 ms
# # because is not building the whole array

def to_lower_case2(str)
    str.split('').each_with_index do |value, index|
      if !!(/[A-Z]/ =~ value)
        str_asc = value.ord
        low_asc = str_asc + 32
        ac_low_asc = low_asc.chr("UTF-8")
        str[index] = ac_low_asc
      end
    end
    str
end
