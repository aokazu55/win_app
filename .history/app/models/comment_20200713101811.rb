class Comment < ApplicationRecord
  belongs_to :service, optinal: true
end
