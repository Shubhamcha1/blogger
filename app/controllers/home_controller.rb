class HomeController < ApplicationController
	 before_action :fetch_list, only: %i[index]
	
	def index
		#fetch all blog in index page
		@blogs = Blog.paginate(page: params[:page],per_page: 5).order(created_at: :desc)
	end

	private

	def fetch_list
		
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
