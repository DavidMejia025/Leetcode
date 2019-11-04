def find_longest_dominos
  domino_string = load_file

  domino_string.each {|string| p longest_dominos(string) }
end
# nombrar las varioables i, j mas describpotivamente
# pieces
# quemar el input
#hacker rank to txt and simulate
# tratar de lograr un codigo lo mas leghible posible

def longest_dominos(string)
  i      = 0
  j      = 0
  result = 0

  return 0 if string.length < 2

	for k in (0..(string.length) - 2) do
		left  = string[k][2]
		rigth = string[k + 1][0]

    if (left == rigth)
      j += 1
    else
      i = j
    end

		result = [result, j - i].max
	end

	result
end



def load_file
	file = File.open("dominio-input.txt", "r").map {|line| line.chomp.split(",") }

	file
end

find_longest_dominos
