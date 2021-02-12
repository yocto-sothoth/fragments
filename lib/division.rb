# division(100)
# => [1, 2, 4, 5, 10, 20, 25, 50, 100]

def division(n)
  d1 = []
  d2 = []

  1.upto(m = Math.sqrt(n)) do |i|
    if n % i == 0
      d1 << i
      d2 << n / i
    end
  end

  d1.pop if m.to_i == m
  d1 + d2.reverse
end
