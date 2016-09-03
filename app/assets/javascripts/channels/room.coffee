App.room = App.cable.subscriptions.create channel: "RoomChannel",
  collection: -> $("#messages")

  connected: (data) ->
    # Called when the subscription is ready for use on the server
    setTimeout =>
      @followCurrentMessage()
      @installPageChangeCallback()
    , 1000

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append(this.renderMessage(data));
    $('#message_body').val ''

  followCurrentMessage: ->
    if roomId = @collection().data('room-id')
      @perform 'follow', id: roomId
    else
      @perform 'unfollow'

  renderMessage: (msg) ->
    """
      <p> <b>#{msg.user_id}: </b>#{msg.body}</p>
    """

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'turbolinks:load', -> App.room.followCurrentMessage()