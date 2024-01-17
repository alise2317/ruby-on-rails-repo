# frozen_string_literal: true

# class CalcHelper
module CalcHelper
  def calc_automorf(nnn)
    result = []
    1.upto(nnn) do |x|
      break if nnn < 1 || nnn > 100

      x_x = x**2
      x_size = x.to_s.length
      x_x_size = x_x.to_s.length
      a = x_x.to_s
      result.push [x, x_x] if x == a[x_x_size - x_size, x_x_size].to_i
    end
    result
  end
end
