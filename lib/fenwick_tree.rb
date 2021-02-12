class FenwickTree
  def initialize(n)
    @size = n
    @data = Array.new(n + 1, 0)
  end

  def add(i, x)
    while i <= @size
      @data[i] += x
      i += (i & -i)
    end
  end

  def sum(i)
    s = 0
    while i > 0
      s += @data[i]
      i -= (i & - i)
    end
    s
  end
end
