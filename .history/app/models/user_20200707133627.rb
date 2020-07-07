class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :confirmable
        #  :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  attachment :image

  has_many :services, dependent: :destroy
  # has_one :profile, dependent: :destroy

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
