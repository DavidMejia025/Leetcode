# 66. Plus One
# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits) #  24 ms 9.3 MB
    sum(digits,1)
end

def sum(digits, carry)
    return carry > 0 ? [carry] : [] if digits.empty?

    last_digit = digits.pop + carry

    if  last_digit > 9
        new_digit = last_digit % 10
        carry     = last_digit / 10
    else
        new_digit = last_digit
        carry     = 0
    end

    return sum(digits,carry).push(new_digit)
end

# variant iteration with reduce

def plus_one(digits) # 48ms 9.4 Mb
    carry = 1

    accu = digits.reverse.reduce([]) do |accu, digit|
        sum = digit + carry

        if  sum > 9
            new_digit = sum % 10
            carry     = sum / 10
        else
            new_digit = sum
            carry     = 0
        end

        accu.push(new_digit)
    end

    accu.push(carry) if carry > 0

    accu.reverse
end

# variant of iteration from letcode 32ms 9.4
# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  i = digits.length - 1
  carry = 0
  while i >= 0
    tmp_sum = (digits[i] + carry)
    tmp_sum += 1 if i == digits.length - 1
    carry = tmp_sum/10
    digits[i] = tmp_sum % 10
    i -= 1
  end
  digits.unshift carry if carry == 1
  d
