class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :roles
  has_many :groups, through: :roles
  has_many :messages, dependent: :destroy

  has_one :profile

  delegate :user_name, to: :profile
  delegate :bio, to: :profile
  delegate :full_name, to: :profile
  delegate :age, to: :profile

  before_create :build_default_profile

  def name
    email.split('@')[0]
  end

  def get_groups
    self.groups.where(private: false).where("roles.role_type='member' OR roles.role_type='admin'")
  end

  def get_admin_groups
    self.groups.where(private: false).where("roles.role_type='admin'")
  end

  def get_banned_groups
    self.groups.where(private: false).where("roles.role_type='banned'")
  end

  def not_in_groups
    if self.group_ids.empty?
      Group.where(private: false)
    else
      Group.where(private: false).where('id NOT IN (?)',self.group_ids)
    end
  end


  private


  def build_default_profile
    build_profile
    true
  end
end
