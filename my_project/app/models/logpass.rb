class Logpass < ApplicationRecord
  validates :log, presence: true, length: {minimum: 5}
  validates :pass, presence: true, length: {minimum: 5}
end
