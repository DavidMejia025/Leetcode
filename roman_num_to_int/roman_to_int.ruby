# @param {String} s
# @return {Integer}
def roman_to_int(s)
    number = 0
    i = 0
    while i < (s.length) do
        num = convert_number[s[i]]

        if (s[i] == "X" || s[i] == "I" || s[i] == "C") && substract?(s[i], s[i+1])
            next_num = convert_number[s[i + 1]]
            num      = next_num - num  

            i +=1
        end

        number += num
        
        i += 1
    end
    
    number
end

def substract?(num, next_num)
   return false if next_num.nil?

   result = if (num + next_num) == "IV" || (num + next_num) == "IX"
       true
   elsif (num + next_num) == "XL" || (num + next_num) == "XC"
       true
   elsif (num + next_num) == "CD" || (num + next_num) == "CM"
       true
   else
       false
   end

   result
end
      
def convert_number
    {
        "I" =>             1,
        "V" =>             5,
        "X" =>             10,
        "L" =>             50,
        "C" =>             100,
        "D" =>             500,
        "M" =>             1000    
    }
end

