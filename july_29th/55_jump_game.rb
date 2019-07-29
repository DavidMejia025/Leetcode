# Given an array of non-negative integers, you are initially positioned at the first index of the array.
#
# Each element in the array represents your maximum jump length at that position.
#
# Determine if you are able to reach the last index.
# example:
# Input: [2,3,1,1,4]
# Output: true
#
# Input: [3,2,1,0,4]
# Output: false
#
#Pseudocode:
#
#(1) Find one zero position and store in zero_index variable
#(2) from (1) position calculate if the zero could be passed
#    (3) if for any jumps previews zero_index the result is grater than zero index
#          go to (1)
#        else return false
#
#
def can_jump?(a)
  return true if a.length == 1

  zero_positions = [0]

  a.each_with_index do|jump, index|
    if index < (a.length - 1) && jump == 0
      zero_positions.push(index)

      return false unless can_jump_zero?(a, zero_positions)
    end
  end

  true
end

def can_jump_zero?(a, index)
  k = index[-1]
  i = 1

  return true if a[k+1] == 0

  while k > index[-2] do
    return true if a[k-1] > i

    k -= 1
    i += 1
  end

  false
end

# happy path test:
a = [2,3,1,1,4]
p can_jump?(a)
p can_jump?([3,2,1,0,4])
#
# edge_cases
p can_jump?([2,0])
p can_jump?([2,0,0,0,0])
