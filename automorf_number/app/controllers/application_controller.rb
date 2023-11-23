class ApplicationController < ActionController::Base
  def input
  end
  def view
  @result = case params[:op]

    def automorphic_numbers(n)
      automorphic_nums = []

      (1..n).each do |num|
        square = num**2
        num_digits = num.to_s.length
        last_digits = square.to_s[-num_digits..-1].to_i

        automorphic_nums << num if num == last_digits
      end

      automorphic_nums
    end
  end
end
