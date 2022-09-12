Rails.application.routes.draw do
  
  devise_for :users
  
resources :blogs do
resources :comments, only: %i[create]

end 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"

get "category" ,to: "blogs#categories_blog_list" ,as: :categories_list

#like the blogs in blogger 
  
get "like" ,to: "likes#like" , as: :like

get "unlike" ,to: "likes#unlike" , as: :unlike 

#comments reply 

  get "reply" ,to: "comments#reply" ,as: :reply 

  post "comment_reply",to: "comments#replies" ,as: :reply_comment

  get "delete_comment" ,to: "comments#delete" ,as: :delete_comment


end
