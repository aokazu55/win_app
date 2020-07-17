class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :service
  paginates_per 4
end
