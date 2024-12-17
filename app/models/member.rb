class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :name, presence: true
    validates :furigana, presence: true
    validates :nickname, presence: true
    validates :address, presence: true
end
