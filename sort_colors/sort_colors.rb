# Given an array with n objects colored red, white or blue, sort them in-place so that objects of
#the same color are adjacent, with the colors in the order red, white and blue.
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
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
# 2nd version improved
# 2 0 2 1 1 0
# 0 2 2 1 1 0
# 0 1 2 1 0 2
# 0 1 1 0 2 2
# 0 1 0 1 2 2
# 0 0 1 1 2 2
# end
#

def sort_colors(nums) # 64 ms, faster than 10.09%
  aux    = ""
  finish = false

  while finish == false do
    finish = true
    for i in 0..(nums.length) - 2 do
      if nums[i] > nums[i+1]
        aux = nums[i]
        nums[i] = nums[i+1]
        nums[i+1] = aux
        finish = false
      end
    end
  end
  p nums
end
def sort_colors(nums) # 44 ms, faster than 14.68%
  aux    = ""
  finish = false

  while finish == false do
    finish = true

    for i in 0..(nums.length) - 2 do
      if nums[i] > nums[i+1]
        aux       = nums[i]
        nums[i]   = nums[i+1]
        nums[i+1] = aux

        finish = false
      elsif nums[i] == nums[i+1]
        i += 1
      end
    end
  end
  p nums
end

def sort_colors(nums)
  aux    = ""
  finish = false

  while finish == false do
    finish = true
    j      = 0

    for i in 0..(nums.length) - 2 do
      if nums[i] == nums[i+1]
        i += 1
      elsif nums[i] > nums[i+1]
        aux       = nums[i]
        nums[i]   = nums[i+1]
        nums[i+1] = aux

        finish = false

        if nums[i] < nums[i-1]
          aux       = nums[i-1]
          nums[i-1] = nums[i]
          nums[i]   = aux
        end
      end
    end
    p nums
  end
end

def sort_colors(nums)
  aux    = ""
  finish = false

  while finish == false do
    finish = true
    j      = 0

    for i in 0..(nums.length) - 2 do
      if nums[i] == nums[i+1]
        i += 1
      elsif nums[i] > nums[i+1]
        aux       = nums[i]
        nums[i]   = nums[i+1]
        nums[i+1] = aux

        finish = false

        if nums[i] < nums[i-1]
          aux       = nums[i-1]
          nums[i-1] = nums[i]
          nums[i]   = aux
        end
      end

      if finish == false && j > 0
        if nums[j] == nums[j-1]
          j += 1
        elsif nums[-1-j] < nums[-2-j]
          aux       = nums[j-1]
          nums[j-1] = nums[j]
          nums[j]   = aux

          if nums[j] > nums[j+1]
            aux       = nums[j+1]
            nums[j+1] = nums[j]
            nums[j]   = aux
          end
        end
        j += 1
      end
    end
  end
  p nums
end

def sort_colors_let_code_fastest(nums) #28 ms, faster than 99.08%
  zero_index = -1
  one_index = -1
  two_index = -1
  nums.each_with_index do |num, index|
    if num == 0
      zero_index += 1
      one_index += 1
      two_index += 1
      tmp_0 = nums[zero_index]
      tmp_1 = nums[one_index]
      if zero_index == one_index && one_index == two_index
        next
      elsif zero_index == one_index || one_index == two_index
        nums[zero_index] = num
        nums[two_index] = tmp_0
      else
        nums[zero_index] = num
        nums[one_index] = tmp_0
        nums[two_index] = tmp_1
      end
    elsif num == 1
      one_index += 1
      two_index += 1
      tmp = nums[one_index]
      nums[one_index] = nums[two_index]
      nums[two_index] = tmp
    else
      two_index += 1
    end
  end
  nums
end

nums = [2,0,2,1,1,0]
nums = [0, 0, 0, 1, 1, 1, 2, 2, 2, 2]
nums = [2,2,0,0,2,0,2,1,0]

sort_colors(nums)
