class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
      ActionCable.server.broadcast "notifications-#{message.group.id}_channel", message: render_notifications(message, message.group.id)
      ActionCable.server.broadcast "#{message.group.id}_channel", message: render_titlechange(message)
  end

  private

  def render_titlechange(message)
    MessagesController.render partial: 'messages/titlechange', locals: {message:message}
  end

  def render_notifications(message, groupid)
    MessagesController.render partial: 'messages/notifications', locals: {message:message, groupid: groupid}
  end
end
