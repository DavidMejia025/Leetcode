def generate_parenthesis(n)
  parenthesis = build_solution([], ["("], n, 1, 0)
  parenthesis.map{|obj| obj.join("")}
end

def build_solution(result, array, num, open_parenthesis, close_parenthesis)

  if(open_parenthesis == num && close_parenthesis == num)
    result.push(array)
  end

	if open_parenthesis > 0
		(build_solution(result, array.clone.push("("), num, open_parenthesis + 1, close_parenthesis)) if open_parenthesis < num
  end

  if close_parenthesis < num
		(build_solution(result, array.clone.push(")"), num, open_parenthesis, close_parenthesis + 1)) if (close_parenthesis < num) && (close_parenthesis < open_parenthesis)
	end

  result
end

p generate_parenthesis(3)
