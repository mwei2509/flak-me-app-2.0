class Profile < ApplicationRecord
  belongs_to :user
  before_create :set_user_name


    private

    def set_user_name
      self.user_name = User.find(user_id).email
    end
end
