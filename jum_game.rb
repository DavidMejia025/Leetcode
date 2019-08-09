#Botom top DP
def can_jump(n)
    memo = []

    for  i  in 0..(n.length) - 1 do
            memo[i] = "unknown";
    end

    memo[(n.length) -1] = "good"

    i = (n.length) - 2

    while i >= 0 do
        min_jump = [i + n[i], n.length - 1]
p "min_ jumop"
        p min_jump
        furthest_jump = min_jump.min

        for j in 0..furthest_jump do
            p j
            memo[j] == "good" ? memo[i] = "good" : false
            p memo[j]
            return false if memo[j] == false
        end

      i-=1
    end

    return memo[0] == "good"
end



# top bottom
#
def can_jump(n)
    memo = []

    for  i  in 0..(n.length) - 1 do
            memo[i] = "unknown";
    end

    memo[(n.length) -1] = "good"

    can_jump_from_position(memo, 0, n)
end

 def can_jump_from_position(memo, position, n)
     p " #{position} -- #{memo}"

    if memo[position] != "unknown"
        return memo[position] == "good" ? true : false
    end

     min_jump      = [position + n[position], n.length - 1]
     furthest_jump = min_jump.min

     for i in position + 1..furthest_jump do
         p i
         p furthest_jump
           if can_jump_from_position(memo, i, n)
                memo[position] = "good"
                return true;
           end
    end

    memo[position] = "bad"

     return false
 end

#mine DP but not quite
#
def can_jump(n)
    memo = []

    for  i  in 0..(n.length) - 1 do
            memo[i] = "unknown";
    end

    memo[(n.length) -1] = "good"

    memo_good = (n.length) -1

    i = (n.length) - 2

    while i >= 0 do
        jump = n[i]

        memo[i] = (i + jump >= memo_good) ? "good" : "bad"

        memo_good = i if memo[i] == "good"
      i-=1
    end

    return memo[0] == "good"
end

# ` without memo array
#
def can_jump(n)
      memo_good = (n.length) -1

    i = (n.length) - 2

    while i >= 0 do
        jump = n[i]

        memo_good = i if i + jump >= memo_good

        i-=1
    end

    return memo_good == 0
end
