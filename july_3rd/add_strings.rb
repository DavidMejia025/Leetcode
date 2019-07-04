# @param {String} num1
# @param {String} num2
# @return {String}
# 1st solution
def add_strings(num1, num2)
   sum = (convert_string_to_num(num1) + convert_string_to_num(num2)).to_s
end

def convert_string_to_num(num)
    accu = []
    num  = num.split("")
    size = num.size-1

    num.each_with_index { |letter, index| accu.push(number[letter.ord]*power(10, size-index)) }

    accu.sum
end

def number
    Hash[(48..57).zip(0..9)]
end

def power(num,exp)
   return 1 if exp == 0

   num * power(num, exp-1)
end

# 2nd try way much better not computating in every loop again power x
#
# @param {String} num1
# @param {String} num2
# @return {String}
def add_strings(num1, num2)
   sum = (convert_string_to_num(num1) + convert_string_to_num(num2)).to_s
end

def convert_string_to_num(num)
    accu = []
    num  = num.split("")
    mult = 1

    num.reverse.each_with_index do |letter, index|
        accu.push(number[letter.ord]*mult)

        mult *= 10
    end

    accu.sum
end

def number
    Hash[(48..57).zip(0..9)]
end

# 3rd try solving it with carriage   380 ms	23.9 MB
# @param {String} num1
# @param {String} num2
# @return {String}
def add_strings(num1, num2)
   num1 = convert_string_to_num(num1)
   num2 = convert_string_to_num(num2)

   sum_numbers(num1,num2,0).join
end

def convert_string_to_num(num)
    num.split("").map { |letter| number[letter.ord] }
  # num.split("").map { |letter| letter.to_i }  60 ms	11 MB
end

def number
    Hash[(48..57).zip(0..9)]
end

def sum_numbers(num1, num2, carriage)
     return carriage > 0 ? [].push(carriage) : [] if num1.empty? && num2.empty?

     if !num1.empty? && !num2.empty?
        iter_sum = num1.pop + num2.pop + carriage
        results  = calculate_values(iter_sum)

        return sum_numbers(num1, num2, results[:carriage]).push(results[:result])
     else
        next_num = num1.pop || num2.pop
        results  = calculate_values(next_num + carriage)

        return sum_numbers(num1, num2, results[:carriage]).push(results[:result])
     end
end

def calculate_values(sum)
    {
        result:   sum > 9 ? sum - 10 : sum,
      # result:   sum%10,
        carriage: sum > 9 ? 1 : 0
    }
end

# another alternative in the sum_numbers method

def sum_numbers(num1, num2, carriage)
     return carriage > 0 ? [].push(carriage) : [] if num1.empty? && num2.empty?

     if num1.empty? || num2.empty?
        next_num = num1.pop || num2.pop
        results  = calculate_values(next_num + carriage)

        return sum_numbers(num1, num2, results[:carriage]).push(results[:result])
     else
        iter_sum = num1.pop + num2.pop + carriage
        results  = calculate_values(iter_sum)

        return sum_numbers(num1, num2, results[:carriage]).push(results[:result])
     end
end

