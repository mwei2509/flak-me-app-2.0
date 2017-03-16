# jQuery(document).on 'turbolinks:load', ->
#   notifications = $('#notifications')
#   if $('#notifications').length > 0
#     notifications_to_bottom = -> notifications.scrollTop(notifications.prop("scrollHeight"))
#
#     notifications_to_bottom()
#
#     App.global_group = App.cable.subscriptions.create {
#         channel: "GroupsChannel"
#         group_id: "notifications-"+notifications.data('group-id')
#       },
#
#       connected: ->
#         # Called when the subscription is ready for use on the server
#
#       disconnected: ->
#         # Called when the subscription has been terminated by the server
#
#       received: (data) ->
#         notifications.append data['notification']
#         notifications_to_bottom()
#
#       send_notification: (notification, group_id) ->
#         @perform 'send_notification', notification: notification, group_id: group_id
#
#
#     $('#new_notification').submit (e) ->
#       $this = $(this)
#       textarea = $this.find('#notification_body')
#       if $.trim(textarea.val()).length > 1
#         App.global_group.send_notification textarea.val(), notifications.data('group-id')
#         textarea.val('')
#       e.preventDefault()
#       return false
