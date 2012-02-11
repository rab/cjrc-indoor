class Range
  def fill_order
    result = []
    source = self.to_a
    source.size.times do |i|
      result.unshift(i.odd? ? source.shift : source.pop)
    end
    result
  end
end
