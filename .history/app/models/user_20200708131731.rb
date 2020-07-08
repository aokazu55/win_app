class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :confirmable
        #  :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  attachment :image
  acts_as_paranoid without_default_scope: true #論理削除データがクエリの検索条件に引っかからないように設定

  has_many :services, dependent: :destroy
  has_one :profile, dependent: :destroy

  validates :name, presence: true, length: { maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness_without_deleted: true, allow_blank: true, if: :email_changed?,
                    presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def active_for_authentication?
    super && (self.deleted_at == nil)
  end

  # def self.included(base)
  #   base.extend ClassMethods
  #   assert_validations_api!(base)

  #   base.class_eval do
  #     validates_presence_of   :email, if: :email_required?
  #     validates_format_of     :email, with: email_regexp, allow_blank: true, if: :email_changed?
  #     validates_presence_of     :password, if: :password_required?
  #     validates_confirmation_of :password, if: :password_required?
  #     validates_length_of       :password, within: password_length, allow_blank: true
  #   end
  # end

  def user_profiles
    profiles.map(&:profile)
  end

end
