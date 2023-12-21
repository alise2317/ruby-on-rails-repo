class LogpassController < ApplicationController
  def index
    @logpass = Logpass.all
  end
end
