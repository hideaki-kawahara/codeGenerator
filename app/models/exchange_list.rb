class ExchangeList < ApplicationRecord
  belongs_to :user
  belongs_to :code_list
  before_create { self.token = SecureRandom.urlsafe_base64 }
end
