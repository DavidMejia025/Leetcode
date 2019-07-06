# 67 Add binary
#
# Given two binary strings, return their sum (also a binary string).

# The input strings are both non-empty and contains only characters 1 or 0.
#
# @param {String}  a
# @param {String}  b
# @return {String}

def add_binary(a, b)
  a = a.split("")
  b = b.split("")

  sum(a,b,"0").join
end

def sum(num1, num2, carriage)
  last_num1 = num1.pop
  last_num2 = num2.pop

  return carriage == "1" ? [carriage] : [] if   last_num1.nil? && last_num2.nil?

  if last_num1 && last_num2
   bin_sum = sum_binary(last_num1, last_num2)
   new_num = sum_binary(bin_sum[:partial], carriage)

   carriage = sum_binary(bin_sum[:carriage], new_num[:carriage])[:partial]

   return sum(num1,num2, carriage).push(new_num[:partial])
  end

  new_num = sum_binary(last_num1 || last_num2, carriage)

  return sum(num1, num2, new_num[:carriage]).push(new_num[:partial])
end

def sum_binary(num1, num2)
   return {partial: "0", carriage: "0"}  if num1 == "0" && num2 == "0"

   return {partial: "0", carriage: "1"}  if num1 == "1" && num2 == "1"

   {partial: "1", carriage:"0"}
end

# Variant letcode solutions
# lazzynes
#
def add_binary(a, b)
    (a.to_i(2) + b.to_i(2)).to_s(2)
end


# cariant 2 iterative
#
def add_binary(a, b)
    ai = a.length - 1
    bi = b.length - 1
    carry_over = 0
    sol = ''
    while (ai >= 0 || bi >=0 || carry_over > 0)
        sum = carry_over
        if ai >= 0
            sum += a[ai].to_i
        end
        if bi >= 0
            sum += b[bi].to_i
        end
        carry_over = sum / 2
        sol = (sum % 2).to_s + sol

        ai -= 1
        bi -= 1
    end

    sol
end

a =        "010"
b =        "111"
output =  "1001"

p add_binary(a,b)
p output
