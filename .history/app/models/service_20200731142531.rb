class Service < ApplicationRecord
  attachment :image
  has_many :comments, dependent: :destroy
  has_one :trades
  belongs_to :user
end
