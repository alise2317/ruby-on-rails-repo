# frozen_string_literal: true

class RkController < ApplicationController
  def input; end

  def view
    arr = params[:val].split.map(&:to_i)

    if arr.empty?
      flash[:alert] = 'Ошибка. Вы не ввели массив. Попробуйте еще раз'
      redirect_to action: :input and nil
    end
    new_arr = []
    positive = arr.select(&:positive?)
    sr_arifm = positive.sum / positive.size.to_f
    index = arr.size / 2
    arr[index] = sr_arifm

    arr.each do |element|
      new_arr << element
    end

    @before = arr
    @after = new_arr
  end
end
