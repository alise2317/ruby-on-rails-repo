class CalcController < ApplicationController
  def input; end

  def view
    num = params.permit(:number)
    @calculator = Calc.new(num)
    @hash = @calculator.result
    flash_info_of_request
  end

  def show_db
    respond_to do |format|
      format.html
      format.xml { render xml: Calc.all }
    end
  end

  def flash_info_of_request
    flash[:notice] = if @calculator.flag
                       "Результат #{@calculator.num} добавлен в базу данных"
                     else
                       "Результат #{@calculator.num} не был добавлен в базу данных"
                     end
  end
end
