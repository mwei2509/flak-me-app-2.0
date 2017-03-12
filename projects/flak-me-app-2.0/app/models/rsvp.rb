class Rsvp < ApplicationRecord
  belongs_to :event
  belongs_to :user

  def self.rsvp(user, event)
    Rsvp.find_or_create_by(user: user, event: event)
  end
end
