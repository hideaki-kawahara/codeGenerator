class ExchangeList < ApplicationRecord
  belongs_to :user
  belongs_to :code_list
  validates :user_id, uniqueness: true
  before_create { self.token = SecureRandom.urlsafe_base64 }
end
