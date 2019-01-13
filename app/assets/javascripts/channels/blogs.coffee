jQuery(document).on 'turbolinks:load', ->
  comments = $('#comments')
  if comments.length > 0
    App.global_chat = App.cable.subscriptions.create {
      channel: "BlogsChannel"
      blog_id: comments.data('blog-id')
    },
    connect: ->
    disconnected: ->
    received: (data) ->
      comments.append data['comment']
    send_comment: (comment, blog_id) ->
      @perform 'send_comment', comment: comment_blog_id: blog_id
  $('#new_commment').submit (e) ->
    $this = $(this) #creating a instance to work with to work with the  data
    textarea = $this.find('#comment_content')
    if $.trim(textarea.val()).lenght > 1 #trim method removes excess whitespace
      App.global_chat.send_comment(textarea.val()),
      comments.data('blog-id')
      textarea.val('')
    e.preventDefault()
      return false
