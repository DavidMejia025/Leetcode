def add_two_numbers(l1, l2)
    add_two_numbers_rec(l1, l2, 0)
end

def add_two_numbers_rec(l1, l2, carry)
    head, carry = sum(l1, l2, carry)

    n1 = l1.nil? ? nil : l1.next
    n2 = l2.nil? ? nil : l2.next
    if n1.nil? && n2.nil?
        head.next = ListNode.new(1) if carry > 0
    else
        tail = add_two_numbers_rec(n1, n2, carry)
        head.next = tail
    end

    head
end

def sum(l1, l2, carry)
    v1 = l1.nil? ? 0 : l1.val
    v2 = l2.nil? ? 0 : l2.val
    node = ListNode.new(v1 + v2 + carry)

    carry = 0
    if node.val > 9
        node.val = node.val - 10
        carry = 1
    end

    [node, carry]
end
