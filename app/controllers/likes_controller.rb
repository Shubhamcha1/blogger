class LikesController < ApplicationController

	def like
    @likes = Like.new(user_id: current_user.id , blog_id: params[:blog_id])
    respond_to do |format|
      if @likes.save!
      		format.turbo_stream{render turbo_stream: turbo_stream.prepend('unlike', partial: 'likes/unlike')}
      else
       	
      end
    end
	end 

	def unlike 

		@unlike = Like.find_by(user_id: current_user.id , blog_id: params[:blog_id])
		respond_to do |format|
      if @unlike.destroy
        format.turbo_stream { render turbo_stream: turbo_stream.replace('like_button', partial: 'likes/like', locals: { like: Like.new }) }
        format.html { render partial: 'likes/like', locals: { like: Like.new }}
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('unlike_button', partial: 'likes/unlike', locals: { like: @like }) }
        format.html { render partial: 'likes/unlike', locals: { like: @like }}
      end
    end

	end


end
