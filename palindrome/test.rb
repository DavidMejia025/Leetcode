def isPalindrome?(word)
  word.downcase
  head = 0;
  tail = (word.length) -1

  while (head < tail) do 
	  puts word[head]
	  puts word[tail]
    if(word[head] == word[tail])
      head += 1
      tail -= 1
    else
      return false
    end
  end

  return true
end

puts isPalindrome?("Deleveled")
