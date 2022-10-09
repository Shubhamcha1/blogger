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