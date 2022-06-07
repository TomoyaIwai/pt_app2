class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :rooms, dependent: :destroy

  validates :nickname, presence: true
end
