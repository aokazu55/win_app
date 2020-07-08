class Profile < ActiveRecord::Base
  # extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    validate :check_number_of_profile

    def check_number_of_profile
      if current_user.profile.count == 0
        current_user.profile.save
      else
        errors.add(:user, "プロフィール登録は１つのみ")
      end
    end
    # belongs_to_active_hash :address
    # belongs_to_active_hash :gender
    # belongs_to_active_hash :personality
    # belongs_to_active_hash :special_skill

  with_options presence: true do
    validates :nickname, length: { maximum: 20 }
    validates :date_of_birth
    # validates :gender_id
    # validates :address_id
    # validates :personality_id
    # validates :special_skill_id
    validates :introduce
    # validates :user_id
    end
  end