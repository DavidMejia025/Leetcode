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

    head   = sum_list(0, l1, l2)
end

def add_carry(tail)
    if tail.next == 1
        tail.next = ListNode.new(1)
        tail.next.next = nil
    else
        tail.next = nil
    end

    tail
end

def sum_list(carry, l1, l2)
     if l2.next.nil? && l1.next.nil?
         head = sum(l1, l2, carry)

         return add_carry(head)
     end

    head      = sum(l1, l2, carry)

    l1 = l1.next.nil? ?ListNode.new(0) : l1.next
    l2 = l2.next.nil? ?ListNode.new(0) : l2.next

    head.next = sum_list(head.next, l1, l2)

    return head
end

def sum(l1, l2, carry)
    sum    = l1.val + l2.val + carry
    carry  = sum / 10
    result = sum % 10

    new_node      = ListNode.new(result)
    new_node.next = carry

    new_node
end



