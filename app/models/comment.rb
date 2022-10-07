class Comment < ApplicationRecord

	include ActionView::RecordIdentifier

	belongs_to :user
	belongs_to :blog
	#has_many :comment_replies, class_name:"CommentReply" , dependent: :delete_all
	has_many :comment ,class_name: 'CommentReply',foreign_key: "comment_id", dependent: :destroy
	has_many :reply ,class_name: 'CommentReply' ,foreign_key: "reply_id" , dependent: :destroy

		
  	after_create_commit { broadcast_prepend_to [blog, :comments], target: "#{dom_id(blog)}_comments" }

  	validates_presence_of :body

   	#after_create_commit { broadcast_prepend_to [@comment,:comments], target: "#{dom_id(comment)}_comments" }


end
