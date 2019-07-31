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
# (1) Find the first unknown letter
#     if letter not found
#       return false
#     else
#       store current possition and look for the next letter in any of the north east south or west neighboors
#
#     if  second letter was not found
#       go to (3)
#     elsif new_word is equal to input
#       return true
#     elsif
#       store all directions in wich the next letter was found
#     end
# (3) pop one direction and move to it and
#     go (2).
#
class Candidate
  attr_accessor :letter, :possition_in_word, :position_in_board, :neighbors

  def initialize(letter, position_word, letter_position, neighbors)
    @letter             = letter
    @position_in_word   = position_word
    @position_in_board  = letter_position
    @neighbors          = neighbors
  end
end


def exist(board, word)
  letter_stack = []
  word_index   = 0

  for i in 0..(word.length)- 1 do
    result = false
    letter_pos = find_letter(board, word[0])

    if letter_pos
      letter_stack = []
      find_word(board, word, letter_stack, letter_pos, word_index)
p "index"
p word_index
      return true
    end
  end

  result
end

def find_word(board, word, letter_stack, letter_pos, word_index)
  letter_neighbors = find_next_letter(board, word[word_index+1], letter_pos)
p "find_word"
  p letter_stack
p letter_pos
p word_index
  return false if letter_neighbors.empty?
  return true  if word_index+1 == (word.length) - 1

  letter_stack.push(Candidate.new(word[word_index], word_index, letter_pos, letter_neighbors))

  new_direction = letter_stack[0].neighbors.pop

  find_word(board, word, letter_stack, new_direction.values[0], word_index += 1)
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

  column = letter_pos[0] - 1
  row    = letter_pos[1]

  return {north: [column, row]} if board[column][row] == letter

  false
end

def find_south(board, letter, letter_pos)
  return false  if letter_pos[0] == (board.length) -1

  column = letter_pos[0] + 1
  row    = letter_pos[1]

  return {south: [column, row]} if board[column][row] == letter

  false
end

def find_east(board, letter, letter_pos)
  return false  if letter_pos[1] == (board[0].length) - 1

  column = letter_pos[0]
  row    = letter_pos[1] + 1

  return {east: [column, row]} if board[column][row] == letter

  false
end

def find_west(board, letter, letter_pos)
  return false  if letter_pos[1] == 0

  column = letter_pos[0]
  row    = letter_pos[1] - 1

  return {west: [column, row]} if board[column][row] == letter

  false
end

board = [[1,4,2],[4,9,4],[2,4,2]]
word  = [1,4,2,2]

board.each{|row| p row }
p word
p "Start"
p exist(board, word)
