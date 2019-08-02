# Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.# @param {Integer} a
# @param {Integer} b
# @return {Integer}
def get_sum(a, b)
    num_a, sign_a = abs_val(a)
    num_b, sign_b = abs_val(b)

    a = num_a.times.map{|item| sign_a * (item + 1)}
    b = num_b.times.map{|item| sign_b * (item + 1)}

    return b.length * sign_b if a.empty?
    return a.length * sign_a if b.empty?

    if (sign_a == -1 && sign_b == 1) || (sign_a == 1 && sign_b == -1)
        result = []

        if a.length > b.length
            for i in 0..(a.length) -1 do
                result.push(a[i]) if b[i] == nil
            end

            return sign_a * (result.size)
        else
            for i in 0..(b.length) - 1 do
              result.push(b[i]) if a[i] == nil
            end

            return sign_b * (result.size)
        end
    end

    p result = (a.push(b).flatten).size

    return result if (sign_a == 1 && sign_b == 1)

    return sign_a * result
end

def abs_val(num)
    return (-1) * num, -1 if num < 0
    return num, 1
end

#digital sum
#def get_sum(a, b)
	if a == 0
		return b
    end
	if b == 0
		return a
    end
	return get_sum(2*(a&b), a^b)
end

def get_sum(a, b)
    # http://stackoverflow.com/questions/8698959/how-to-force-ruby-to-store-a-small-number-as-32-bit-integer
    a = Array(a).pack('l').unpack('l').first
    b = Array(b).pack('l').unpack('l').first
    p a
    p b
    # https://discuss.leetcode.com/topic/50178/golang-0ms-with-explantation
    #   A	B	C	S
    #   0	0	0	0
    #   1	0	0	1
    #   0	1	0	1
    #   1	1	1	0

    return a if b.zero?
    return b if a.zero?

    sum   = a ^ b
    carry = (a & b) << 1

    get_sum(sum, carry)
end

# bit manipulation
# def get_sum(a, b)
        # 32 bits integer max
        max= 0x7FFFFFFF
        # 32 bits interger min
        min = 0x80000000
        # mask to get last 32 bits
        mask = 0xFFFFFFFF
        while b != 0
        # ^ get different bits and & gets double 1s, << moves carry
        a, b = (a ^ b) & mask, ((a & b) << 1) & mask
        # if a is negative, get a's 32 bits complement positive first
        # then get 32-bit positive's Python complement negative
        end
        if a <= max
            a
        else
            a = ~(a ^ mask)
        end
end
a = 2147
b = -2140

p :w
p get_sum(a, b)
