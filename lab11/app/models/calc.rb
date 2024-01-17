class Calc < ApplicationRecord
  include CalcHelper
  attr_accessor :num, :flag

  validates :number, uniqueness: true
  self.primary_key = :number
  def result
    @num = number.to_i
    @flag = true
    if Calc.find_by_number(@num).nil?
      @ordinary_result = calc_automorf(@num).map { |number| number[0] }
      @squared_result = calc_automorf(@num).map { |number| number[1] }
      Calc.create!(number: @num, ordinary: @ordinary_result.to_json, squares: @squared_result.to_json)
    else
      calc = Calc.find_by_number(@num)
      @ordinary_result = JSON.parse(calc.ordinary)
      @squared_result = JSON.parse(calc.squares)
      @flag = false
    end
    Hash[@ordinary_result.zip @squared_result]
  end
end
