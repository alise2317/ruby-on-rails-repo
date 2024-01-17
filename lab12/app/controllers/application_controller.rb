# frozen_string_literal: true
# App
class ApplicationController < ActionController::Base
    before_action :authenticate_user!
end