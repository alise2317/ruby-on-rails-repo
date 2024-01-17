class CalcController < ApplicationController
  include CalcHelper
  before_action :authenticate_user!
  def input; end

  def view
    @number = params['num'].to_i
    @result = calc_automorf(@number)
  end
end
