# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
#
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
#
# Example:
#
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
#
# Explanation: 342 + 465 = 807.
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)

end
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    result    = sum_list(l1, l2)
    last_node = get_last_node(result)

    carry = last_node.next == 1

    result.val = result.val + 1 if carry

    last_node.next = nil

    result
end

def sum_list(l1, l2)
  if l1.next == nil
      p l1.val
      p l2.val
    return sum(l1, l2, 0)
  end

  result          = sum_list(l1.next, l2.next)
  last_node       = get_last_node(result)
  last_node.next  = sum(l1, l2, last_node.next)

  return result
end

def sum(l1, l2, carry)
  sum    = l1.val + l2.val + carry
  carry  = sum / 10
  result = sum % 10

  new_node      = ListNode.new(result)
  new_node.next = carry

  new_node
end

def get_last_node(node)
    return node unless node.next.class == ListNode

    return get_last_node(node.next)
end:w

# second version
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  return l2 unless l1
  return l1 unless l2

  result = sum_list(l1, l2)
end

def sum_list(l1, l2)
  result = sum(l1, l2, 0)

  number_1 = l1.next
  number_2 = l2.next

  until number_1.nil? && number_2.nil?
    last_node = get_last_node(result)

    sum_k          = sum(number_1, number_2, last_node.next)
    last_node.next = sum_k

    number_1 = number_1.next
    number_2 = number_2.next
  end

  last_node = get_last_node(result)

  carry = ListNode.new(1) if last_node.next == 1

  if number_1
    add_remaining(last_node, number_1, carry)
  elsif number_2
    add_remaining(last_node, number_2, carry)
  else
    last_node.next = carry
  end

p last_node
  last_node = get_last_node(result)

  carry = ListNode.new(1) if last_node.next == 1

  last_node.next = carry

  last_node.next = nil
  result
end

def sum(l1, l2, carry)
  sum    = l1.val + l2.val + carry
  carry  = sum / 10
  result = sum % 10

  new_node      = ListNode.new(result)
  new_node.next = carry

  new_node
end

def get_last_node(node)
    return node unless node.next.class == ListNode

    return get_last_node(node.next)
end

def add_remaining(node, number, carry)
  if carry
    if number
        sum_k     = sum(number, carry, 0)
        node.next = sum_k

        number = number.next
    else
        node.next = carry
    end
  end

  last_node = get_last_node(node)
p " init"
p number
p node
  add_remaining(last_node, number, ListNode.new(1)) if last_node.next == 1

  last_node      = get_last_node(node)
  last_node.next = number
  last_node
end
#

# Definitive
#
def add_two_numbers(l1, l2)
  return l2 unless l1
  return l1 unless l2

  result = sum_list(l1, l2)
end

def sum_list(l1, l2)
  result = sum(l1, l2, 0)

  number_1 = l1.next
  number_2 = l2.next

  until number_1.nil? && number_2.nil?
    last_node = get_last_node(result)

    if number_2.nil?
        sum_k          = sum(number_1, ListNode.new(0), last_node.next)
        last_node.next = sum_k

        number_1 = number_1.next
    elsif number_1.nil?
        sum_k          = sum(ListNode.new(0), number_2, last_node.next)
        last_node.next = sum_k

        number_2 = number_2.next
    else
      sum_k          = sum(number_1, number_2, last_node.next)
      last_node.next = sum_k

      number_1 = number_1.next
      number_2 = number_2.next
    end
  end

  last_node = get_last_node(result)

  last_node.next = ListNode.new(1) if last_node.next == 1

  last_node = get_last_node(result)

  last_node.next = nil

  result
end

def sum(l1, l2, carry)
  sum    = l1.val + l2.val + carry
  carry  = sum / 10
  result = sum % 10

  new_node      = ListNode.new(result)
  new_node.next = carry

  new_node
end

def get_last_node(node)
    return node unless node.next.class == ListNode

    return get_last_node(node.next)
end
#
l1 = [2,4,3]
l2 = [5,6,4]
