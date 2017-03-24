class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
      ActionCable.server.broadcast "notifications-#{message.group.id}_channel", message: render_notifications(message)
      # ActionCable.server.broadcast "#{message.group.id}_channel", message: render_notifications(message)
  end

  private

  def render_notifications(message)
    MessagesController.render partial: 'messages/notifications', locals: {message:message}
  end
end
