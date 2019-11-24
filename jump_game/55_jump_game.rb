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
#Let code Solution:
#This is a dynamic programming[1] question. Usually, solving and fully understanding a dynamic programming problem is a 4 step process:
#
# Start with the recursive backtracking solution
# Optimize by using a memoization table (top-down[2] dynamic programming)
# Remove the need for recursion (bottom-up dynamic programming)
# Apply final tricks to reduce the time / memory complexity
# All solutions presented below produce the correct result, but they differ in run time and memory requirements.
#
def can_jump?(a) # 56 ms, faster than 17.02%
  return true if a.length == 1

  a.each_with_index do|jump, index|
    return false if index == 0 && jump == 0

    if jump == 0
      return false unless can_jump_zero?(a, index)
    end
  end

  true
end

def can_jump_zero?(a, index)
  k = index
  i = 1

  while k > 0 do
    return true if index == (a.length) - 1 && a[k-1] >= i

    return true if a[k-1] > i || a[index+1] == 0

    k -= 1
    i += 1
  end

  false
end

def can_jump(nums) # ruby fastests
  return true if nums.length < 2
  current = nums.length - 1
  distance = 0
  while current > 0
    current -= 1
    distance += 1
    if nums[current] >= distance
      distance = 0
    end
  end
  return distance == 0
end

# happy path test:
# = [2,3,1,1,4]
# can_jump?(a)
p can_jump?([3,2,1,0,4])
#
# edge_cases
p can_jump?([2,0])
p can_jump?([2,0,0,0,0])
p can_jump?([4,0,0,0,1,4])
p can_jump?([3,0,0,0,0])
p "123"
p can_jump?([2,1,0,0])
p can_jump?([5,9,3,2,1,0,2,3,3,1,0,0])
