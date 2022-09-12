class Like < ApplicationRecord

	belongs_to :user
	belongs_to :blog

	  after_create_commit { broadcast_append_to('unlike') }
end
