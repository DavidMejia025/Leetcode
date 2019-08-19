# Given an array, rotate the array to the right by k steps, where k is non-negative.
#
# Input: [1,2,3,4,5,6,7] and k = 3
# Output: [5,6,7,1,2,3,4]
# Explanation:
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]
#
def rotate(a, k)
  return a if k == 0
  b = []
  length = a.length

  rotate = length - k

  b[0..k]  = a[rotate..-1]
  b[k..-1] = a[0..rotate-1]

  b
end

a = [1,2,3]
k = 1
a = [1,2,3,4,5,6,7]
k = 3
p rotate(a, k)
