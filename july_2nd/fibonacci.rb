# recursion execersice #1:

def fibonacci(num)
  stop = if num == 1
    return 1
  elsif num < 1 
    return 0
  end

  fibonacci(num-1) + fibonacci(num-2)
end

10.times do |number|
puts "result = #{fibonacci(number)}"
end


Paso por valor y paso por referencia

