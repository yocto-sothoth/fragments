# extended_euclidean(30, 22)
# => [3, -4]
# 30 * 3 + 22 * (-4) == 30.gcd(22)
# => true

def extended_euclidean(a, b)
  r0 = s1 = 1
  s0 = r1 = 0

  while b != 0
    q, r = a.divmod(b)
    a, b = b, r
    r1, r0 = r0 - q * r1, r1
    s1, s0 = s0 - q * s1, s1
  end

  [r0, s0]
end

def inv(x, mod)
  extended_euclidean(x, mod)[0]
end
