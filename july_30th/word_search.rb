# Given a 2D board and a word, find if the word exists in the grid.
#
# The word can be constructed from letters of sequentially adjacent cell, where
# "adjacent" cells are those horizontally or vertically neighboring. The
# same letter cell may not be used more than once.
#
# Example:
#
# board =
# [
#   ['A','B','C','E'],
#   ['S','F','C','S'],
#   ['A','D','E','E']
# ]
#
# Given word = "ABCCED", return true.
# Given word = "SEE", return true.
# Given word = "ABCB", return false.
#
# PseudoCode
# while looking for letters of word input and word not found
# (1) Find the first letter of the world
#     if first letter not found
#       return false
#     else
#       store current possition, found and go (2)
# (2) Given current possition, look for the next letter in any of the north east south or west neighboors
#     if  second letter was not found
#       return to (1)
#     elsif new_word is equal to input
#       return true
#     elsif
#       store all directions in wich the next letter was found
#     end
# (3) pop one direction and move to it and
#     go (2).
#
def exist(board, word)
  new_word     = []
  letter_stack = []
  word_index   = 0

  while new_word != word
    letter_pos = find_letter(board, word[word_index])

    return false if letter_pos == false

    letter_neighbors = find_next_letter(board, word[word_index += 1], letter_pos)

    return false if letter_neighbors.empty?

    letter_stack.push([letter_pos, letter_neighbors])

    p letter_stack
    break
  end
end

def find_letter(board, letter)
  for i in 0..(board[0].length-1) do
    for j in 0..board.length-1 do
       return [i,j] if board[i][j] == letter
    end
  end
  false
end

def find_next_letter(board, letter, letter_pos)
  letter_in_north = find_north(board, letter, letter_pos)
  letter_in_south = find_south(board, letter, letter_pos)
  letter_in_east  = find_east(board,  letter, letter_pos)
  letter_in_west  = find_west(board,  letter, letter_pos)

  result = []

  result.push(letter_in_north) if letter_in_north
  result.push(letter_in_south) if letter_in_south
  result.push(letter_in_east)  if letter_in_east
  result.push(letter_in_west)  if letter_in_west

  result
end

def find_north(board, letter, letter_pos)
  return false  if letter_pos[0] == 0
  "north"
end

def find_south(board, letter, letter_pos)
  return false  if letter_pos[0] == (board.length) -1
  "south"
end

def find_east(board, letter, letter_pos)
  return false  if letter_pos[1] == (board[0].length) - 1
  "east"
end

def find_west(board, letter, letter_pos)
  p letter_pos
 return false  if letter_pos[1] == 0
 "west"
end

board = [[1,2,3],[1,2,3],[1,4,9]]
word  = [9]

p exist(board, word)
