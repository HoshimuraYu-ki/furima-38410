class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_nickname,       presence: true
  validates :user_first_name,     presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :user_last_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :user_first_name_kana,presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :user_last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :user_date_of_birth,  presence: true
end
