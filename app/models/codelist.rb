class Codelist < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 2048 }
  validates :url, presence: true, length: { maximum: 2048 }
  validates :password_digest, presence: true, length: { maximum: 256 }
end
