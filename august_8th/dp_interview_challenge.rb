#
#
#
#
# pass with num
# pass without number
#
#
#
def find_sum(num, a, carry, index)
  return 0 if index == (a.length) * -1 - 1

  current    = [a[index]]
  left_carry = current + carry

  index -= 1

  return 0 if sum_num(num, left_carry) > num

  left  = find_sum(num, a, left_carry, index) + sum_num(num, left_carry)
  rigth = find_sum(num, a, carry, index)

  return left + rigth
end

def sum_num(num, carry)
p carry
 carry.reduce(&:+) == num ? 1 : 0
end

num = 16
a   = [6, 10, 20, 20]
p "start"
p find_sum(num, a, [0], -1)
p "result"
