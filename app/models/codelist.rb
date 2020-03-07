class Codelist < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 2048 }
  validates :url, presence: true, length: { maximum: 2048 }
  validates :password_digest, presence: true, length: { maximum: 256 }
  validates :title, presence: true, length: { maximum: 256 }

  class << self
    # 渡された文字列のハッシュ値を返す
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end
end