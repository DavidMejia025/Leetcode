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
#
# Summary:
#sum list creates the new list
#sum creates new node to append to the new list
#until goes deeper into the l1 and l2 list doing l1.next and l2.next for each step
# get last node ensure to link the new node to the bottom of the new list.
#
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

