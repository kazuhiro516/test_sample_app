class User < ApplicationRecord
  # db登録直前にemailを全て小文字に変換する処理
	before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  # メールアドレスのバリデーションを設定
  # フォーマットと一意であることの確認
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
  			format: { with: VALID_EMAIL_REGEX }
  			uniqueness: true
end
