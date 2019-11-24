# Given an array, rotate the array to the right by k steps, where k is non-negative.
#
# Input: [1,2,3,4,5,6,7] and k = 3
# Output: [5,6,7,1,2,3,4]
# Explanation:
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]
#
def rotate(nums, k)
  return nums if k == 0
  length = nums.length

  for j in 1..k do
    aux_last = nums[-1]

    for i in 0..(nums.length) - 1 do
      aux_prev = nums[i]

      nums[i] = aux_last

      aux_last = aux_prev
    end
  end
  nums
end

a = [1,2,3]
k = 1
a = [1,2,3,4,5,6,7]
k = 3
p rotate(a, k)
