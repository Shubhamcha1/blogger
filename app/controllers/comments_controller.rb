class CommentsController < ApplicationController
  before_action :comment, only: %i[ reply ]

	  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)  
    @master_comment_id = params[:comment][:comment_id].to_i

  if @master_comment_id != 0
      respond_to do |format|
      if @comment.save 
        comment_reply(@master_comment_id, @comment.id)
        format.turbo_stream { render turbo_stream: turbo_stream.replace('comment_form', partial: 'comments/form', locals: { comment: Comment.new })}
        format.html { render partial: 'comments/form', locals: { comment: Comment.new }}
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('comment_form', partial: 'comments/form', locals: { comment: @comment }) }
        format.html { render partial: 'comments/form', locals: { comment: @comment }}
      end
    end
  else
      respond_to do |format|
      if @comment.save 
        format.turbo_stream { render turbo_stream: turbo_stream.replace('comment_form', partial: 'comments/form', locals: { comment: Comment.new })}
        format.html { render partial: 'comments/form', locals: { comment: Comment.new }}
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('comment_form', partial: 'comments/form', locals: { comment: @comment }) }
        format.html { render partial: 'comments/form', locals: { comment: @comment }}
      end
    end
  end 

  end 


  #this section for when we use single form for the
        #if @reply_id != nil
        # comment_reply(@reply_id, @comment.id)

        #end

  def reply
       @blog = Blog.find(params[:blog_id])
       @comment = CommentReply.where(reply_id: params[:comment_id]).order(created_at: :desc)
  end


  def delete
      delete = Comment.find(params[:id])
      if delete.destroy           
      else 

      end 
  end 

  private 

  

  def comment_reply(master_comment_id,reply_comment_id)
    @blog = Blog.find(params[:blog_id]) 
      @reply = @blog.comment_replies.new
      @reply.comment_id = reply_comment_id
      @reply.reply_id = master_comment_id
      @reply.save!
  end


  def comment
    @comment = Comment.find(params[:comment_id])
    #fetch latest 
    @latest = Blog.order(id: :desc).limit(3)

    #fetch recent viewed 
    if current_user != nil
    @viewed = UserVisitBlog.where(user_id: current_user.id).order(created_at: :desc).limit(3)
    end
  end


  def comment_params
    params.require(:comment).permit(:body,:user_id)
  end


end
