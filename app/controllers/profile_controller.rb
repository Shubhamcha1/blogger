class ProfileController < ApplicationController

    def profile 
        #fetch top liked blog
        @my_blogs = Blog.where(user_id: current_user.id)  
        
    end

    def userblog 

    end


end
