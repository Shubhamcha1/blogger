class HomeController < ApplicationController
	 before_action :fetch_list, only: %i[index]
	
	def index
	

	end

	private

	def fetch_list
		#fetch all blog in index page
		@blogs = Blog.all.order(created_at: :desc)

		#fetch categories list from database
		@categories = MasterCategory.all

		#fetch latest in index page 
		@latest = Blog.order(id: :desc).limit(3)

		#fetch recent viewed 
		if current_user != nil
		@viewed = UserVisitBlog.where(user_id: current_user.id).order(created_at: :desc).limit(3)
		end 
	end
	 
	
end
