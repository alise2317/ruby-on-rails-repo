class ApplicationController < ActionController::Base
  around_action :switch_locale
  @@locale = "ru"
  def switch_locale(&action)
    if params[:locale]!=nil
      @@locale = params[:locale]
    end
    I18n.with_locale(@@locale,&action)
  end
  def self.get_locale
    @@locale
  end

end
