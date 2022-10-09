class ProfileController < ApplicationController

    def profile 
        #fetch top liked blog
        @my_blogs = Like.select('blog_id, count(blog_id) as count').group(:blog_id).limit(6)
        
    end

    def userblog 

    end


end
