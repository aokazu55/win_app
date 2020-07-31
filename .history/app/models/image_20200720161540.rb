class ProductImage < ApplicationRecord
  belongs_to :service	
  attachment :image

end
