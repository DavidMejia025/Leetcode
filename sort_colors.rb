# Given an array with n objects colored red, white or blue, sort them in-place so that objects of
#the same color are adjacent, with the colors in the order red, white and blue.

# Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
# red   0
# white 1
# blue  2
# Example:
# Input:  [2,0,2,1,1,0]
# Outout: [0,0,1,1,2,2]
#
# buble sort with some logic
# count 0s 1s 2s
# for length 0s
# do bubple sort
# for length 1s
# do bubble sor
# for length 2s
# do buble sor
#
# manual test
# colors = [2,0,2,1,1,0]
#
# 2 2 1 1 0 0
# 2 2 1 0 0 1
# 2 2 0 0 1 1
# 2 0 0 1 1 2
# 0 0 1 1 2 2
#
# 2nd version:
# 2 0 2 1 1 0
# 0 2 2 1 1 0 take color [0] and find if it is grater that the next one if so changed if not move one index
# 0 2 1 2 1 0
# 0 1 2 2 1 0
# 0 1 2 1 2 0
# 0 1 1 2 2 0
# 0 1 1 2 0 2
# 0 1 1 0 2 2
# 0 1 0 1 2 2
# 0 0 1 1 2 2
# end
# 2 0 2 1 1 0
# 0 2 1 1 0 2
# 0 1 1 0 2 2
# 0 1 0 1 2 2
# 0 0 1 1 2 2
# end
