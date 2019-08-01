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
# (1) find first letter of the word.
#     if not found return false
#     else go to (2)
# (2) DFS for the next word:
#     find every neighbor that contains the next word
#     if no one was found return false
#     else DFS on every neighbor for the next word
#
# DFS pseudo code
# (1) look if the target words is found and continue serching for the next word
#     if there is no next word return false
#     if next word found is the last letter of word return true
#     else continue searching
#
#
def exist(board, word)
  board_dim  = [board.length, board[0].length]
  word_index = 0
  next_pos   = [0,0]

  for i in 0..(board_dim[0]) - 1 do
    for j in 0..(board_dim[1]) - 1 do
      return true if find_word(board, word, word_index, [i,j]) == true
    end
  end

  false
end

def find_word(board, word, word_index, letter_pos)
  return true   if      word_index == (word.length) - 1
  return false  unless  board[letter_pos[0]][letter_pos[1]] == word[word_index]

  word_index += 1

  next_level = find_next_letter(board, word[word_index], letter_pos)

  next_level.map do|neighbor|
    return true  if find_word(board, word, word_index, neighbor.values[0]) == true
  end
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

board = [[1,4,2],[1,4,2],[2,7,3]]
word  = [1,4,2,3, 8]

board.each{|row| p row }
p word
p "Start"
p exist(board, word)

board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
word  = "ABCB".split("")
board.each{|row| p row }
p word
p "start"
p exist(board, word)
