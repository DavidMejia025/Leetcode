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
# # @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    return l2 unless l1
    return l1 unless l2

    result = sum(l1, l2, 0)

    tail   = sum_list(result, l1.next, l2.next)

    add_carry(tail)

    result
end

def add_carry(tail)
    if tail.next == 1
        tail.next = ListNode.new(1)
        tail.next.next = nil
    else
        tail.next = nil
    end
end

def sum_list(result, l1, l2)
    return result if l2.nil? && l1.nil?

    if l2.nil?
        l2 = ListNode.new(0) if l2.nil?
        result.next = sum(l1, l2, result.next)
    elsif l1.nil?
        l1 = ListNode.new(0) if l1.nil?
        result.next = sum(l1, l2, result.next)
    else
        result.next = sum(l1, l2, result.next)
    end

    sum_list(result.next, l1.next, l2.next)
end

def sum(l1, l2, carry)
    sum    = l1.val + l2.val + carry
    carry  = sum / 10
    result = sum % 10

    new_node      = ListNode.new(result)
    new_node.next = carry

    new_node
end
