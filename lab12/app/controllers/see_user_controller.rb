class SeeUserController < ApplicationController
  def All
    @users = User.all
  end

  def ShowYou
    @user = current_user
  end
end
