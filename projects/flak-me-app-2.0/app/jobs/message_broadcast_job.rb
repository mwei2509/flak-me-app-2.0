class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    if message[:type]=="flash"
      ActionCable.server.broadcast "#{message[:group_id]}_channel",
      message: render_flash(message)
    else
      ActionCable.server.broadcast "#{message.group.id}_channel",
                                  message: render_message(message)
    end
  end

  private

  def render_message(message)
    MessagesController.render partial: 'messages/message', locals: {message: message}
  end

  def render_flash(message)
    MessagesController.render partial: 'messages/flash', locals: {message:message}
  end
end
