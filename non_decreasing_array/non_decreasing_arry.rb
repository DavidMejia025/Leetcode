# 665. Non-decreasing Array

# Given an array with n integers, your task is to check if it could become non-decreasing by modifying at most 1 element.

# We define an array is non-decreasing if array[i] <= array[i + 1] holds for every i (1 <= i < n).
#
# @param {Integer[]} nums
# @return {Boolean}
def check_possibility?(nums) # 44 ms, faster than 97.37% 11.4 MB, less than 100.00%
  length_nums = nums.length
  count       = 0

  (length_nums - 1).times do |i|
    break  if count > 1

    if increasing?(nums,i)
      next
    else
      modify_element(nums,i)

      count += 1

      next if increasing?(nums,i)

      count += 1
    end
  end

  count < 2 ? true : false
end

def increasing?(nums, i)
  return nums[i] <= nums[i+1] if i == 0

  nums[i] <= nums[i+1] && nums[i-1] <= nums[i]
end

def modify_element(nums,i)
  temp = nums[i]

  return nums[i] = nums[i+1] if i == 0

  nums[i] = nums[i-1]

  return if increasing?(nums,i)

  nums[i]   = temp
  nums[i+1] = nums[i]
end

 p nums  = [4,2,3]
 p nums2 = [2,3,3,2,4]
 p nums3 = [3,4,2,3]
 p nums4 = [-1,4,2,3]
 p nums5 = [2,3,3,2,4]
 p check_possibility?(nums)
 p check_possibility?(nums2)
 p check_possibility?(nums3)
 p check_possibility?(nums4)
 p check_possibility?(nums5)

 #Ruby solution that follows the greedy like approach
 # @param {Integer[]} nums
# @return {Boolean}
def check_possibility(nums)
    number_of_swaps = 0

    nums.each_with_index do |current, index|
        return false if number_of_swaps > 1
        next if index == 0
        if nums[index - 1] > current
            number_of_swaps += 1
            if (index < 2) || (nums[index - 2] <= current)
                nums[index - 1] = current
            else
                nums[index] = nums[index - 1]
            end
        end
    end
    number_of_swaps <= 1
end


# Python clean solution
#
#
def checkPossibility(self, nums):
    count_dec = 0
    for i in range(len(nums) - 1):
        if nums[i] > nums[i + 1]:
            count_dec += 1
            if i == 0:
                nums[i] = nums[i + 1]
            elif nums[i - 1] <= nums[i + 1]:
                nums[i] = nums[i - 1]
            else:
                nums[i + 1] = nums[i]
        if count_dec > 1:
            return False
    return True

