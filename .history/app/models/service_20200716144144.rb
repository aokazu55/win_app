class Service < ApplicationRecord
  attachment :image
  has_many :comments, dependent: :destroy
  belongs_to :user

  paginates_per 3
  default_scope :order => 'created_at DESC'
  # belongs_to :buyer, class_name: "User"
  # belongs_to :seller, class_name: "User"
end
