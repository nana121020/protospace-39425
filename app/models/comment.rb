class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :prototype, dependent: :destroy
  belongs_to :user
end
