class WeightedUnionFind
  def initialize(n)
    @par = Array.new(n, -1)
    @wgt = Array.new(n, 0)
  end

  def root(x)
    if @par[x] < 0
      x
    else
      r = root(@par[x])
      @wgt[x] += @wgt[@par[x]]
      @par[x] = r
    end
  end

  def size(x)
    -@par[root(x)]
  end

  def weight(x)
    root(x)
    @wgt[x]
  end

  def diff(x, y)
    weight(y) - weight(x)
  end

  def unite(x, y, w)
    w += weight(x) - weight(y)
    x = root(x)
    y = root(y)
    return if x == y

    if size(x) < size(y)
      x, y = y, x
      w *= -1
    end

    @par[x] -= size(y)
    @par[y] = x
    @wgt[y] = w
  end
end
