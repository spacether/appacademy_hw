class Map

  def initialize
    @keys = []
    @vals = []
  end

  def assign(key, val)
    index = @keys.index(key)
    if index.nil?
      @keys << key
      @vals << val
    else
      @vals[index] = val
    end
  end

  def lookup(key)
    index = @keys.index(key)
    return nil if index.nil?
    @vals[index]
  end

  def remove(key)
    index = @keys.index(key)
    return nil if index.nil?
    @keys.delete_at(index)
    @keys.delete_at(index)
  end

  def show
    (0...@keys.length).map { |i| [@keys[i], @vals[i]] }
  end

end

m = Map.new
m.assign(1, "hello")
m.assign(2, "there")
p m.show
m.remove(2)
p m.show
p m.lookup(1)
