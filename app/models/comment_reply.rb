class CommentReply < ApplicationRecord

	belongs_to :comment , class_name: "Comment"
	belongs_to :reply , class_name: "Comment"
	belongs_to :blog
	


end
