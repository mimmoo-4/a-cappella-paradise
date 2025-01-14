class Post < ApplicationRecord
  belongs_to :member
  belongs_to :genre, optional: true

  validates :post_title, presence: true
  validates :post_text, presence: true
  validates :member_id, presence: true
  validates :genre_id, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("post_title LIKE?", "#{word}")
    elsif search == "forward_match"
      @post = Post.where("post_title LIKE?", "#{word}%")
    elsif search == "backward_match"
      @post = Post.where("post_title LIKE?", "%#{word}")
    elsif search == "partial_match"
      @post = Post.where("post_title LIKE?", "%#{word}%")
    else
      @post = Post.all
    end
  end

end
