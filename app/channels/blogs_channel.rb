class BlogsChannel < ApplicationCable::Channel

  def subscribed
    # Ex. blogs_4_channel
    stream_from "blogs_#{params.['blog.id']}_channel" 
  end

  def unsubscribed

  end

  def send_comment data
    # Creates and sends comment to db
    current_user.comments.create!(content: data['comment'], blog_id: data['blog_id']) 
  
  end

end