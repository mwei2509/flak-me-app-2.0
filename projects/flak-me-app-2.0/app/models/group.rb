class Group < ApplicationRecord
  has_many :roles, dependent: :destroy
  has_many :users, through: :roles
  has_many :messages, dependent: :destroy
  has_one :slide
  # attr_accessor :group_img_file_name
  # attr_accessor :group_img_content_type
  has_attached_file :image
  validates :title, presence: true, uniqueness: true, case_sensitive: false, length:{in: 3..30}
  validates :title, format: { without: /\A[@]/, message: "reserved character" }, if: "!private" #no @ if not a DM

  has_attached_file :group_img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "ghost.png"
  validates_attachment_content_type :group_img, content_type: /\Aimage\/.*\z/

  before_validation :sanitize, :slugify

  def to_param
    self.slug
  end

  def slugify
    self.slug = self.title.downcase.gsub(" ", "-")
  end

  def sanitize
    self.title = self.title.strip
  end

  def self.create_slide(slider,slidee)
    name=Slide.sort_users(slider, slidee)
    group="@#{name[:slider]}-#{name[:slidee]}"
    Group.find_or_create_by(title: group, private: true)
  end

  def set_admin(user)
    #user.groups << self
    Role.find_or_create_by(user_id: user.id, group_id: self.id, role_type: "admin")
  end

  def add(user)
    role=Role.find_or_create_by(user_id: user.id, group_id: self.id)
    role.update(role_type:"member")
  end

  def get_admin
    self.users.where("roles.role_type='admin'")
  end

  def get_members
    self.users.where("roles.role_type='member'")
  end

  def get_all_peeps
    self.users.where("roles.role_type='admin' OR roles.role_type='member'")
  end

  def get_banned
    self.users.where("roles.role_type='banned'")
  end

  def deactivate
    self.update(active: false)
  end

  def activate
    self.update(active: true)
  end

  def leave(user)
    Role.find_by(user_id: user.id, group_id: self.id).destroy
  end

  def ban(user)
    role=Role.find_or_create_by(user_id: user.id, group_id: self.id)
    role.update(role_type:"banned")
  end

  def modify(args)
    if args[:role]=="admin"
      case args[:action]
      when "ban"
        self.ban(args[:other_user])
      when "add"
        self.add(args[:other_user])
      when "deactivate"
        self.deactivate
      when "activate"
        self.activate
      end
    else
      case args[:action]
      when "leave"
        self.leave(args[:user])
      when "join"
        self.add(args[:user])
      end
    end
  end
end
