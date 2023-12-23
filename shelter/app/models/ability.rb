# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # гость (не зарегистрированный пользователь)

    if user.admin?
      can :manage, :all
    else
      can :read, :all
      # Дополнительные разрешения для других ролей, если необходимо
    end
  end
end
