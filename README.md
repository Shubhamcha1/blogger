# README

This README would normally document whatever steps are necessary to get the

* ...

like and unlike changeover button is pending 


today 
	add customisation in devise gem
	wroking on comment reply funtionality 
	design in users blog panel.





	
<div class="mx-auto md:w-2/3 w-full flex">
  <div class="mx-auto">
    <% if notice.present? %>
      <p class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block" id="notice"><%= notice %></p>
    <% end %>
    <%= render @blog %>


    <%= @blog.title %>

  <%= @blog.description %>

    <%= link_to 'Edit this blog', edit_blog_path(@blog), class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium" %>
    <div class="inline-block ml-2">
      <%= button_to 'Destroy this blog', blog_path(@blog), method: :delete, class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium" %>
    </div>
    <%= link_to 'Back to blogs', blogs_path, class: "ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium" %>
  </div>
</div>



<%= render partial: "comments/form", locals: { comment: Comment.new } %>
<%= turbo_stream_from @blog, :comments %>
<div id="<%= "#{dom_id(@blog)}_comments" %>">
  <%= render @blog.comments.order(created_at: :desc) %>
</div>



8 sep 2022

comment replies


  Like.select('post_id, count(post_id) as count').group(:post_id).limit(3)



  <div class="flex flex-row justify-center py-5 ">
                         <%if current_user.image.attached?%>
                        <div class="object-cover">
                        <%=image_tag current_user.image.variant(resize: "150x150") ,class:"rounded-lg"%>
                       </div>
                        <%else%>
                        <div>
                        <%=image_tag "user_default.png",class:"rounded-full h-24 w-24"%>
                        </div>
                        <%end%>
                    </div>



                    <div class="flex flex-row justify-center content-center">
  <div class="upload_field">
  <%=f.file_field :image ,class:"focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800"%>
  </div>
</div>