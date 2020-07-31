class Service < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_attachments_for :images, attachment: :image

  has_many :comments, dependent: :destroy
  has_one :trade
  belongs_to :user
end
