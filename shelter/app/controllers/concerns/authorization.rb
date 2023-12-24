module Authorization
  extend ActiveSupport::Concern
  included do
  include pundit
  end
end
