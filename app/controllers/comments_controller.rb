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

       @master_comment = Comment.find(params[:comment_id])
  end


  def delete
      delete = Comment.find(params[:comment_id])
     if delete.destroy           
        redirect_to blog_path(params[:blog_id])
     end 
  end 


  def reply_delete
    delete = Comment.find(params[:reply_id])
    if delete.destroy
      redirect_to reply_path(comment_id: params[:comment_id],blog_id: params[:blog_id])
    end 
  end


  def update
    @categories = MasterCategory.all
		#fetch latest in index page 
		@latest = Blog.order(id: :desc).limit(3)
    		#fetch recent viewed 
		if current_user != nil
      @viewed = UserVisitBlog.where(user_id: current_user.id).order(created_at: :desc).limit(3)
      end 
      @comment = Comment.find(params[:comment_id])
  end


  def update_comment
    update = Comment.find(params[:comment_id])
    master_comment_id = params[:master_comment_id]
    if update.update(body: params[:body])
        if master_comment_id.empty?
          redirect_to blog_path(params[:blog_id]) 
        else
          redirect_to reply_path(comment_id: params[:master_comment_id],blog_id: params[:blog_id]) 
        end
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
   # @comment = Comment.find(params[:comment_id])
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
