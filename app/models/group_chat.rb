class GroupChat < ApplicationRecord
  belongs_to :member
  belongs_to :group

  validates :chat, presence: true
end
