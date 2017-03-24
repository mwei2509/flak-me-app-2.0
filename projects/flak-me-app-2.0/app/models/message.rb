class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :body, presence: true, length: {minimum: 2, maximum: 1000}

  after_create_commit {MessageBroadcastJob.perform_later(self) }
  after_create_commit {NotificationBroadcastJob.perform_later(self)}

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

  def flashmessage

  end
end
