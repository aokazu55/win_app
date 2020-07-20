class Service < ApplicationRecord
  attachment :image
  has_many :comments, dependent: :destroy
  # belongs_to :user
  
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
end
