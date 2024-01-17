# frozen_string_literal: true

# Calc
module CalcHelper
  def calc_automorf(nnn)
    arr = []
    (1..nnn).each do |iii|
      arr.append(iii) if iii == iii**2 % 10 || iii == iii**2 % 100 || iii == iii**2 % 100
    end
    arr
  end
end
