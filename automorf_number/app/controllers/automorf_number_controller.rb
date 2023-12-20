class AutomorfNumberController < ApplicationController
  before_action :assertion, only: [:view]
  def input

  end
  def assertion
    n = params[:val]
    if n.blank?
      flash[:alert] = "Поле ввода не может быть пустым."
      redirect_to action: :input and nil
    end
  end

  def view
    unless params[:val].to_i.to_s == params[:val]
    then
        @result = "Введите корректное значение"
        @solve = [[0,0,0]]
    else
      if params[:val].to_i >= 1000 then @result = "Введите значение меньше 1000"
        @solve = [[0, 0, 0]]
      else
        if params[:val].to_i < 0 then @result = "Введите значение больше 0"
        else
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
        end
      end
    end
  end
end
