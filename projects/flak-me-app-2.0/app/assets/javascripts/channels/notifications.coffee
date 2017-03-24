jQuery(document).on 'turbolinks:load', ->
  notifications = $('.notifications')


  notifications.each ->
    App.global_group = App.cable.subscriptions.create {
        channel: "GroupsChannel"
        group_id: "notifications-"+this.dataset.groupId
      },

      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        notifications.append data['message']
