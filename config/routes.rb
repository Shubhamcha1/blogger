Rails.application.routes.draw do
  
  mount ActionCable.server => '/cable'
  devise_for :users
  
resources :blogs do
resources :comments, only: %i[create reply]

end 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"

get "category" ,to: "blogs#categories_blog_list" ,as: :categories_list

#list of user blogs with edit option
get "my_blogs" ,to: "blogs#my_blogs", as: :my_blogs

#delete blog 
get "delete_blog" ,to: "blogs#destroy", as: :delete_blog


#like the blogs in blogger 
  
get "like" ,to: "likes#like" , as: :like

get "unlike" ,to: "likes#unlike" , as: :unlike 

#comments reply 

  get "reply" ,to: "comments#reply" ,as: :reply 

  post "comment_reply",to: "comments#replies" ,as: :reply_comment

  get "delete_comment" ,to: "comments#delete" ,as: :delete_comment

  get "reply_delete" ,to: "comments#reply_delete", as: :reply_delete

  get "update",to: "comments#update",as: :update

  get "update_comment",to: "comments#update_comment", as: :update_comment

#profile route 

  get "/user/profile" ,to: "profile#profile" ,as: :user_profile

  get "/user/blog" , to: "profile#userblog" ,as: :user_blog
end
