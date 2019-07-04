### Test:
[10,5,15,3,7,null,18]
 7
 15

[10,5,15,3,7,13,18,1,null,6]
6
23

[15,9,21,7,13,19,23,5,null,11,null,17]
19
21

### First try
def range_sum_bstl(root, l, r,total, count = 500)
    count = count +1
    puts "! #{total} total - #{root.val} root"
    left_root  = root

     chao = if left_root.left
        total.push(pick_number(left_root.val, l, r))
        range_sum_bstl(left_root.left, l, r, total, count)
        range_sum_bstr(left_root.right, l, r,total) unless left_root.right == nil
     else
         total.push(pick_number(root.val, l, r))
         total
     end
puts count
     return total.reduce(&:+)
end
def range_sum_bstr(root, l, r,total, count = 500)
    count = count +1
    right_root  = root

     chao = if right_root.right
        puts count
        total.push(pick_number(right_root.val, l, r))
        range_sum_bstl(right_root.left, l, r, total, count) unless right_root.left == nil
        range_sum_bstr(right_root.right, l, r,total)
     else
         total.push(pick_number(root.val, l, r))
         total
     end

     return total.reduce(&:+)
end

def pick_number(number, l, r)
    #puts "pick number : #{number} / #{l} - #{r} / if #{number <= r && number >= l}"
    number <= r && number >= l ? number : 0
end

##### this pass with the method solution and building an array:

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} l
# @param {Integer} r
# @return {Integer}
def range_sum_bst(root, l, r, total = [])
    total_0 = root.val <= r && root.val >= l ? root.val : 0

    range_sum_bst2(root, l, r,total)

    total.reduce(&:+)+total_0
end

def range_sum_bst2(root, l, r,total)
    if root.left
        total.push(root.left.val <= r && root.left.val >= l ? root.left.val : 0)
        range_sum_bst2(root.left, l, r, total)
    end

    if root.right
        total.push(root.right.val <= r && root.right.val >= l ? root.right.val : 0)
        range_sum_bst2(root.right, l, r, total)
    end

     return total
end

def pick_number(number, l, r)
    number <= r && number >= l ? number : 0
end

trying to recursion with numbers

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} l
# @param {Integer} r
# @return {Integer}

def range_sum_bst(root, l, r)
    total = 88

    total_0 = root.val <= r && root.val >= l ? root.val : 0

    total = range_sum_bst2(root, l, r)
    puts total
    total + total_0
end

def range_sum_bst2(root, l, r, total = 0)
    #puts "total> #{total} / root.left #{root.left} root.right #{root.right}"
    puts "!!!  total_right-0: #{total_right ||= total}"
    total_left  = total  ||= 0
    total_right = total ||= 0

    left_branch = if root.left
        total_left += pick_number(root.left.val, l, r)
        #puts "!!!  total_left: #{total_left}"
        range_sum_bst2(root.left, l, r, total_left)
    else
      total_left
    end

    right_branch = if root.right
        puts "!!!  total_right_0: #{total_right}"
        total_right += pick_number(root.right.val, l, r)
        puts "!!!  total_right_1: #{total_right}"
        range_sum_bst2(root.right, l, r, total_right)
    else
      total_right
    end

     return total_right + total_left
end

def pick_number(number, l, r)
    puts "number #{number}"
    number <= r && number >= l ? number : 0
end

failing on the last number return

[10,10,10,1,1,1,1,1,1,1,1,1,1,1,1]

### My solution finally

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} l
# @param {Integer} r
# @return {Integer}

def range_sum_bst(root, l, r)
    total_0 =  pick_number(root.val, l, r)

    total   = total_0 + range_sum_bst2(root, l, r,0)
end

def range_sum_bst2(root, l, r, total)
    if root.left
        total += pick_number(root.left.val, l, r)
        total  = range_sum_bst2(root.left, l, r, total)
    end

    if root.right
        total += pick_number(root.right.val, l, r)
        total = range_sum_bst2(root.right, l, r, total)
    end

    return total
end

def pick_number(number, l, r)
    number <= r && number >= l ? number : 0
end

### Closer to German still missing memoization of the total value

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} l
# @param {Integer} r
# @return {Integer}

def range_sum_bst(root, l, r)
   total = 0

   second_method(root,l,r, total)
end

def second_method(root,l,r, total)
  total = second_method(root.left,  l, r, total )  if root.left
  total = second_method(root.right, l, r, total)   if root.right

  total += root.val <= r && root.val >= l ? root.val : 0
end

#shortest German Solution
   10
  5   10
 3 7    18

def range_sum_bst(root, l, r)
  total  = root.val <= r && root.val >= l ? root.val : 0

  total += range_sum_bst(root.left,  l, r)  if root.left
  total += range_sum_bst(root.right, l, r)  if root.right

  total
end

## other better solution

def range_sum_bst(root, l, r)
    return 0 if root == nil

    if (l <= root.val && root.val <= r)
         return root.val + range_sum_bst(root.left, l, r) + range_sum_bst(root.right, l, r)
    else
        return range_sum_bst(root.left, l, r) + range_sum_bst(root.right, l, r)
    end

end

pasar por referencia o por ...

def iteration(a)
  a.push(2)
end

arr = [1]

iteration(arr) # [1,2]
arr            # [1,2]

def iteration(a)
  arr = [2]
end

iteration(arr)  # [2]
arr             # [1]
