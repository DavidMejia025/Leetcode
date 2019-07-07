# 1021. Remove Outermost Parentheses
#
# A valid parentheses string is either empty (""), "(" + A + ")", or A + B, where A and B are valid
# parentheses strings, and + represents string concatenation.  For example, "", "()", "(())()", and
# "(()(()))" are all valid parentheses strings.
#
# A valid parentheses string S is primitive if it is nonempty, and there does not exist a way to split
# it into S = A+B, with A and B nonempty valid parentheses strings.
#
# Given a valid parentheses string S, consider its primitive decomposition: S = P_1 + P_2 + ... + P_k,
# where P_i are primitive valid parentheses strings.
#
# Return S after removing the outermost parentheses of every primitive string in the primitive decomposition of S.

# valid parentesis string example:
# () (()) ()()
# "", ()  (())() (()(()))
# primitive decomposition is to simplify the parentesis string into a minimum sum of primitive parentesis strings
#
# (()()) + (())
#
# "(()()) (()) (()(())) "
# "()() () () () "
#
# @param {String} s
# @return {String}
# time: start: 21:50  23:02
#
# iterative solution
def remove_outer_parentheses(s) #64 ms	11.4 MB
  primitive_decomposition = []
  count_l = 0
  count_r = 0
  aux         = []

  s.split("").each do |char|
    count_l += 1 if char == "("
    count_r += 1 if char == ")"

    aux.push(char)

    if count_l == count_r
      primitive_decomposition.push(aux)

      reset_counters(count_l, count_r)

      aux = []
    end
  end

  p primitive_decomposition

  remove_extras(primitive_decomposition).join
end

def reset_counters(count_l, count_r)
  count_l = 0
  count_r = 0
end

def remove_extras(s)
  item = s.pop

  return [] if item.nil?

  item.pop
  item.reverse!
  item.pop

  return remove_extras(s).push(item.reverse.join)
end

s = "(()())"
p remove_outer_parentheses(s)

s = "(()())(())(()(()))"
p remove_outer_parentheses(s)

s = "()()"
p remove_outer_parentheses(s)

#variant fastest ruby
def remove_outer_parentheses(s)
  return nil if s.nil?

  key = {
    '(' =>')',
    '{' => '}',
    '[' => ']'
  }

  open = []
  temp = []
  string_array = []

  s.each_char do |bracket|
    if key[bracket]
      open.push(bracket)
    else
      open.pop
    end

    temp.push(bracket)

    if open.empty?
      temp.pop
      temp.shift
      string_array.push(temp.join(''))
      temp = []
    end
  end

  string_array.join('')
end
