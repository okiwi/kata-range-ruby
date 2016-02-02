class RangeInteger
  def initialize(st_range)
    @min=st_range[/(\d)\,/,1].to_i
    @min += 1 if st_range[0] == '('
    @max=st_range[/\,(\d)/,1].to_i
    @max -= 1 if st_range[-1] == ')'
  end

  def contains?(value)
    value.between?(@min, @max)  
  end
end