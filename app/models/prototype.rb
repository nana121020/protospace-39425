class Prototype < ApplicationRecord
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
  #devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :validatable

  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
end
