class Lab101Controller < ApplicationController
  def input
  end

  def view
    automorphic_nums = []
    n = params[:val].to_i
      count = 0
      (1..n).each do |num|
        square = num**2
        num_digits = num.to_s.length
        last_digits = square.to_s[-num_digits..-1].to_i

        if num == last_digits
          automorphic_nums << [count, num, square]
          count += 1
        end
      end
    @result = count
    @solve = automorphic_nums

    render xml: [@result, @solve]
  end
end
