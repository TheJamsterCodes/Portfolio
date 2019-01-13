jQuery(document).on 'turbolinks:load', ->
  comments = $('#comments')
  if comments.length > 0
    App.global_chat = App.cable.subscriptions.create {
      channel: "BlogsChannel"
      blog_id: comments.data('blog-id')
    },
    connect: -> # Called when the subscription is ready for use on the server.
    disconnected: -> # Called when the subsription has been terminated by the server.
    received: (data) -> # Called when there's incoming data on the websocket for this channel.
      comments.append data['comment']
    send_comment: (comment, blog_id) ->
      @perform 'send_comment', comment: comment_blog_id: blog_id
  $('#new_commment').submit (event) ->
    $this = $(this) #creating a instance to work with to work with the  data
    textarea = $this.find('#comment_content')
    if $.trim(textarea.val()).lenght > 1 #trim method removes excess whitespace
      App.global_chat.send_comment(textarea.val()),
      comments.data('blog-id')
      textarea.val('')
    event.preventDefault()
      return false
