def test(a)
  result = 0

  10.times do |i|
    p i
    break result = 8  if  a == 10

    a += 1
  end

  result
end

p test(6)
