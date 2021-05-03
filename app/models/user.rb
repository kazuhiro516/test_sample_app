class User < ApplicationRecord
  # db登録直前にemailを全て小文字に変換する処理
	before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  # メールアドレスのバリデーションを設定
  # フォーマットと一意であることの確認
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
  			format: { with: VALID_EMAIL_REGEX },
        uniqueness: true
  # passwordをハッシュ化しセキュアに設定する
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
