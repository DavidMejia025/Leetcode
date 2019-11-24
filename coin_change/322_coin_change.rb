#You are given coins of different denominations and a total amount of money amount.
#Write a function to compute the fewest number of coins that you need to make up that amount.
#If that amount of money cannot be made up by any combination of the coins, return -1.
#
#Input:  int array coins
#        int amount
#Output: int
#
#Input:  coins = [1, 2, 5], amount = 11
#Output: 3
#Explanation: 11 = 5 + 5 + 1
#Input:  coins = [2], amount = 3
#Output: -1
#
#PseudoCode
#(1) sort coins
#(2) initialize change as empty array and sum equal to 0,  and current coin equal to greates coin
#(3) until sum is grater or equal than amount
#    add current coin to sum. if sum is less or equal than amount push the greates coin to change.
#(4) if sum is equal to amount return change size. Else if coins is empty return -1
#    Else make current coin equal to grates coin and make sum squal to sum of change, then return to (3)
#
#    coins = [1,2,5] amount = 11
#    change= [], sum = 0, current_coin = 5
#
#    !(0 >= 11)
#      sum += 5
#    5 <= 11
#      change = [5]
#
#    !(5>=11)
#      sum += 5
#    10<=11
#      change = [5,5]
#
#    !(10 >= 11)
#       sum += 5
#    15 <= 11
#
#    !(15 >= 11)
#
#    15 == 11
#
#    [1,2]
#
#    current_coin = 2
#    sum = change.sum
#
#    !(10>=11)
#    sum += 2
#    12<=11
#
#    !(12 >= 11)
#
#    12 == 11
#
#    coins = [1]
#
#    current_coin = 1
#    sum = 10
#
#    !(10 >= 11)
#      sum += 1
#    11<= 11
#      change = [5,5,1]
#
#    !(11 >= 11)
#
#    11 == 11
#      return [5,5,1]
#
#    coins = [2] amount = 3
#    change= [], sum = 0, current_coin = 2
#
#    !(0 >= 3)
#      sum += 2
#    2 <= 3
#      change = [2]
#
#   !(2 >= 3)
#     sum += 2
#   4 <= 3
#
#   !(4 >= 3)
#
#   4 == 3
#
#   coins = []
#     return -1
#
#
#
def coin_change(coins, amount)
  coins = coins.sort

  return -1 if coins.empty?
  return -1 if coins[0] > amount

  current_coin = coins.pop
  change       = []
  sum          = 0

  loop_coins(coins, amount ,current_coin, change, sum)
end

def loop_coins(coins, amount, current_coin, change, sum)
  until sum >= amount
    sum += current_coin

    change.push(current_coin) if sum <= amount
  end

  return change.length if sum == amount
  return -1            if coins.empty?

  current_coin = coins.pop
  sum          = change.reduce(&:+)

  return loop_coins(coins, amount, current_coin, change, sum)
end

coins = [1,2,5]; amount = 11
coins = [2]    ; amount = 3
p coin_change(coins, amount)
