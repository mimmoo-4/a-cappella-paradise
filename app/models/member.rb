class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :group_members, dependent: :destroy
  has_many :permits, dependent: :destroy
  has_many :groups, through: :group_members
  has_many :group_chats, dependent: :destroy
  has_one_attached :profile_image


    validates :name, presence: true
    validates :furigana, presence: true
    validates :nickname, presence: true
    validates :address, presence: true

  def get_profile_image(width, height)

    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end

    profile_image.variant(resize_to_fill: [width, height]).processed
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @member = Member.where("nickname LIKE?", "#{word}")
    elsif search == "forward_match"
      @member = Member.where("nickname LIKE?", "#{word}%")
    elsif search == "backward_match"
      @member = Member.where("nickname LIKE?", "%#{word}")
    elsif search == "partial_match"
      @member = Member.where("nickname LIKE?", "%#{word}%")
    else
      @member = Member.all
    end
  end
end
