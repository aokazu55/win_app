class Service < ApplicationRecord
  has_many :product_images, dependent: :destroy
  accepts_attachments_for :product_images, attachment: :image
  attachment :image
  has_many :comments, dependent: :destroy
  belongs_to :user
  # belongs_to :buyer, class_name: "User"
  # belongs_to :seller, class_name: "User"
end
