# 150_evaluate_reverse_polish_notation
#
# Evaluate the value of an arithmetic expression in Reverse Polish Notation.
#
# Valid operators are +, -, *, /. Each operand may be an integer or another expression.
#
# Note:

# Division between two integers should truncate toward zero.
# The given RPN expression is always valid. That means the expression would always evaluate to a result and there won't be any divide by zero operation.
#
# Example 1:
#
# Input: ["2", "1", "+", "3", "*"]    2 1 3 + * =>
# Output: 9
# Explanation: ((2 + 1) * 3) = 9
# Example 2:
#
# Input: ["4", "13", "5", "/", "+"]   4 13 5 / + =>
# Output: 6
# Explanation: (4 + (13 / 5)) = 6
# Example 3:
#
# Input: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
#
#
#        9 + 3      =  12
#        12 * - 11  = -132
#        6 / -132   =  0
#        0 * 10     =  0
#        0 + 17   =  17
#        17 + 5    =  22
# Damn close!!!
#
# 10 + 6
# Output: 22
# Explanation:
#   ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
# = ((10 * (6 / (12 * -11))) + 17) + 5
# = ((10 * (6 / -132)) + 17) + 5
# = ((10 * 0) + 17) + 5
# = (0 + 17) + 5
# = 17 + 5
# = 22
#
# Pseudo Code
# (1). until array A of n elements became an one element array do
# (2). Find the first operator from left to rigth
# (3). apply the operation between the two previos elements
# (4)  take (2) result and replace the two elements involved in the operation
#      with that result. also remove the previeus operator. return (1)
# Manual test:
# a =  ["2", "1", "+", "3", "*"]
# operator                = "+"
# operator_index          =  2
# calculate("+","2", "1") = 3
# a = ["3", "3", "*"]
# operator       = "*"
# index_operator =  2
# calculate("*","3","3")  = 9
# a = [9]
#
# References:
#
# 1. https://whatis.techtarget.com/definition/Polish-notation-prefix-notation
# 2. https://www.scss.tcd.ie/John.Waldron/3d1/rpn.pdf
#
  def eval_rpn_mine(a)
    while a.length > 1
      operator, index_operator =  find_operator(a)

      partial_result = calculate(operator, a[index_operator-2], a[index_operator-1])

      return false if partial_result == false

      a =  apply_calculation_operation(a, index_operator, partial_result)
    end

    a[0]
  end

  def find_operator(a) # try with find as well
    operators = [ "+","-","*","/"]
    operator  = ""
    index     = 0

    a.each_with_index do |element, i|
       if operators.any? {|operator| operator == element}
         operator = element
         index    = i

         break
       end
    end

    return operator, index
  end

  def apply_calculation_operation(a, index_operator, result)
    a[index_operator-2] = result

    a.delete_at(index_operator-1)
    a.delete_at(index_operator-1)

    a
  end

  def calculate(operator, num1, num2)
    num1 = num1.to_i
    num2 = num2.to_i

    case operator
      when "+"
        num1 + num2
      when "-"
        num1 - num2
      when "*"
        num1 * num2
      when "/"
        return  false if num2 == 0
        return  0     if num2 > num1 || (num2 < 0 && ((num2 * -1)  > num1))

        num1 / num2
      else
        p operator
        return "syntax error"
    end
  end

# Test
a = ["2", "1", "+", "3", "*"]
#

#  operator, index =  find_operator(a)
#p operator
#p result = calculate(operator, a[0,], a[1])
#p apply_calculation_operation(a, index, result)
# eval_rpn(a)
# eval_rpn(["4", "13", "5", "/", "+"])
# p eval_rpn(["3","10","5","+","*"])
# p eval_rpn(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"])
leetcode_test = ["-78","-33","196","+","-19","-","115","+","-","-99","/","-18","8","*","-86","-","-","16","/","26","-14","-","-","47","-","101","-","163","*","143","-","0","-","171","+","120","*","-60","+","156","/","173","/","-24","11","+","21","/","*","44","*","180","70","-40","-","*","86","132","-84","+","*","-","38","/","/","21","28","/","+","83","/","-31","156","-","+","28","/","95","-","120","+","8","*","90","-","-94","*","-73","/","-62","/","93","*","196","-","-59","+","187","-","143","/","-79","-89","+","-","3","-"]
p "end"
#p eval_rpn(["17", "3", "-"])
#p "end"
#p eval_rpn(["15", "7", "1", "1", "+","-","/", "3", "*", "2", "1", "1", "+", "+" ,"-"])
#p eval_rpn(["15", "-", "-"])
#p eval_rpn( ["4", "13", "5", "/", "+"])
# Edge cases
#
def eval_rpn(a)
  operators = [ "+","-","*","/"]
  stack     = []
  a.each do|element|
    next stack.push(element) unless  operators.include?(element)

    num2 = stack.pop
    num1 = stack.pop

    stack.push(calculate(element, num1, num2))
  end

  stack[0]
end

#def eval_rpn_fancy_leet_code_sol(a) #56 ms, faster than 31.71%
def eval_rpn(a) #56 ms, faster than 31.71%
    t = a.pop
    return t.to_i if !(op = '+-*/'.index t)
    b, a = eval_rpn(a), eval_rpn(a)
    [a+b, a-b, a*b, a.fdiv(b)][op].to_i
end
ACTIONS = { '*' => true, '+' => true, '-' => true, '/' => true }

# @param {String[]} tokens
# @return {Integer}
def eval_rpn_lc_fastest(tokens)
  stack = []
  loop do
    item = tokens.shift
    break unless item

    if ACTIONS[item]
      val2 = stack.pop
      val1 = stack.pop
      stack.push(val1.to_f.send(item, val2).to_i)
    else
      stack << item.to_i
    end
  end

  stack[0]
end

#p eval_rpn(["17", "3", "-"])
p eval_rpn_lc_fastest(["17","3","-"])
p eval_rpn_lc_fastest(leetcode_test)
#p eval_rpn_mine(leetcode_test)
#p eval_rpn(leetcode_test)
