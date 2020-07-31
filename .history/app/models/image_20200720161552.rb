class Image < ApplicationRecord
  belongs_to :service	
  attachment :image

end
