class CodeList < ApplicationRecord
  belongs_to :user
  has_many :exchange_lists, dependent: :destroy
  has_secure_password
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  before_create { self.password_digest = CodeList.digest(password_digest) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 2048 }
  validates :url, presence: true, length: { maximum: 2048 }, format: /\A#{URI::regexp(%w(http https))}\z/

  validates :password_digest, presence: true, length: { maximum: 100 }
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
