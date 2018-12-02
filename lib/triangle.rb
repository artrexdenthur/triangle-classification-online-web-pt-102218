class Triangle
  
  attr_reader :side_a, :side_b, :side_c, :kind
  
  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
    @kind = self.class.determine_kind(side_a, side_b, side_c)
  end
  
  def self.determine_kind(a, b, c)
    sides = [a, b, c].sort
    if !(sides[2] < sides[0] + sides[1] && sides[0] > 0)
      begin
        raise TriangleError
      rescue TriangleError => error
        puts error.message
      end
    end
    [:equilateral, :isosceles, :scalene][sides.uniq.count - 1]
  end
  
  class TriangleError < StandardError
    
  end
      
  
end
