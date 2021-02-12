class UnionFind
  def initialize(n)
    @par = Array.new(n, -1)
  end

  def root(x)
    @par[x] < 0 ? x : (@par[x] = root(@par[x]))
  end

  def size(x)
    -@par[root(x)]
  end

  def unite(x, y)
    x = root(x)
    y = root(y)
    return if x == y

    x, y = y, x if size(x) < size(y)
    @par[x] -= size(y)
    @par[y] = x
  end
end
