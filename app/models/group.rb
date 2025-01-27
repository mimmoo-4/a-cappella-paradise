class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  belongs_to :owner, class_name: 'Member'
  has_many :members, through: :group_members, source: :member

  validates :name, presence: true
  validates :introduction, presence: true
  has_one_attached :group_image

  def is_owned_by?(member)
    owner.id == member.id
  end

  def includesMember?(member)
    group_members.exists?(member_id: member.id)
  end

  def get_group_image(width, height)
    unless group_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      group_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    group_image.variant(resize_to_fill: [width, height]).processed
  end
end
