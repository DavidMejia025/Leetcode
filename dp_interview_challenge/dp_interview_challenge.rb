#
#
#
#
def find_sum(num, a, a_1, i)

  if i == ((a.length) - 1)
    return a[i]
  end

  return [a_1] + ([find_sum(num, a, a_1, i+1) + find_sum(num, a, a[i] + a_1, i+1)] )
end

num = 8
a   = [1, 2, 4]
a_1 = 0
p find_sum(num, a, a_1, 0)
p "result"
