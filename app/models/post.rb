class Post < ApplicationRecord
  belongs_to :member
  belongs_to :genre

  validates :post_title, presence: true
  validates :post_text, presence: true
  validates :member_id, presence: true
  validates :genre_id, presence: true
end
