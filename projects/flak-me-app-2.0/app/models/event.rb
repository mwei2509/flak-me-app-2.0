class Event < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :rsvps
  has_many :users, through: :rsvps

  def get_participants
    rsvp=Rsvp.where(event: self)
  end
end
