class Profile < ActiveRecord::Base
  # extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    validate :user_profile_count_validate

    def user_profile_count_validate
      if self.user && self.user.profile.count >= User::PROFILE_MAX
        errors.add(:base, "プロフィールの登録は1件まで。")
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