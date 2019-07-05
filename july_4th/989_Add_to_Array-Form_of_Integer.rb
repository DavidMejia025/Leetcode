# 989. Add to Array-Form of Integer:
#
# For a non-negative integer X, the array-form of X is an array of its digits in left to right order.
# For example, if X = 1231, then the array form is [1,2,3,1].
#
# Given the array-form A of a non-negative integer X, return the array-form of the integer X+K.
#
# @param  {Integer[]} a
# @param  {Integer}   k
# @return {Integer[]}

# First solution
def add_to_array_form(a, k)
   a = a.join.to_i
   result = a + k
   result.to_s.split("").map(&:to_i)
end

a      = [9,9,9,9,9,9,9,9,9,9]
k      = 1
result = [1,0,0,0,0,0,0,0,0,0,0]

test = add_to_array_form(a,k)
p result == test

# Variant 1
# Intuition

# Let's add numbers in a schoolbook way, column by column. For example, to add 123 and 912, we add 3+2, then 2+1,
# then 1+9. Whenever our addition result is more than 10, we carry the 1 into the next column. The result is 1035.

def add_to_array_form_2(a, k)
   k      = num_to_array(k)
   lenght = max_lenght(a, k)

   result = sum(a, k, lenght)
end

def num_to_array(num)
  next_num = num/10

  return [] if  num == 0

  num_to_array(next_num).push(num%10)
end

def max_lenght(a, b)
    lenght_a = a.size
    lenght_b = b.size

    lenght_a > lenght_b ? lenght_a : lenght_b
end

def sum(num1, num2, lenght)
  aux      = 0
  result   = []
  carriage = 0

  while aux <= lenght
    index = -1-aux

    digit1 = num1[index] ? num1[index] : 0
    digit2 = num2[index] ? num2[index] : 0

    iter_sum = calculate_sum(digit1 + digit2 + carriage)

    result.push(iter_sum[:result])

    carriage = iter_sum[:carriage]
    aux += 1
  end

  result.reverse
end

def calculate_sum(sum)
    {
      result:   sum%10,
      carriage: sum > 9 ? 1 : 0
    }
end

def add_to_array_form_3(a, k)
  k = num_to_array(k)
  a[-1] = a[-1].push(k)
end

a      = [9,9,9]
k      = 1
result = [1,0,0,0,0,0,0,0,0,0,0]


test = add_to_array_form_3(a,k)
p test == result
p test
