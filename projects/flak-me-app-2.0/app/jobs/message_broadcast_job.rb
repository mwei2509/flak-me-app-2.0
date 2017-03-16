class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    if message[:type]=="flash"
      ActionCable.server.broadcast "#{message[:group_id]}_channel",
      message: render_flash(message)
    else
      ActionCable.server.broadcast "#{message.group.id}_channel",
                                  message: render_message(message)
      # ActionCable.server.broadcast "#{message.group.id}_channel",
      #                             message: render_notifications("notification")

    end

    if message[:type]=="flash"
    else
      ActionCable.server.broadcast "#{message.group.id}_channel",
                                message: render_notifications(message)
    end
  end

  private

  def render_message(message)
    MessagesController.render partial: 'messages/message', locals: {message: message}
    # MessagesController.render partial: 'messages/notifications', locals: {message:message}
  end

  def render_flash(message)
    MessagesController.render partial: 'messages/flash', locals: {message:message}
  end

  def render_notifications(message)
    MessagesController.render partial: 'messages/notifications', locals: {message:message}
  end
end
