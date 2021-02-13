# binary max-heap

class PriorityQueue
  def initialize
    @data = []
    @size = 0
  end

  def push(x)
    i = @size
    @size += 1
    @data << x

    while i != 0
      j = i & 1 == 1 ? i / 2 : i / 2 - 1
      break if @data[i] <= @data[j]

      @data[i], @data[j] = @data[j], @data[i]
      i = j
    end
  end

  def shift
    case @size
    when 0 then return
    when 1
      @size -= 1
      return @data.pop
    end

    i = 0
    @size -= 1
    ret, @data[0] = @data[0], @data.pop

    while (l = i * 2 + 1) < @size
      r = l + 1

      j = !@data[r] || @data[l] >= @data[r] ? l : r
      break if @data[i] >= @data[j]

      @data[i], @data[j] = @data[j], @data[i]
      i = j
    end

    ret
  end
end
