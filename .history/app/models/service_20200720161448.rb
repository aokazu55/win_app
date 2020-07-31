class Service < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_attachments_for :images, attachment: :images
  accepts_nested_attributes_for :images  # 複数形に変更

  has_many :comments, dependent: :destroy
  belongs_to :user
  # belongs_to :buyer, class_name: "User"
  # belongs_to :seller, class_name: "User"
end
