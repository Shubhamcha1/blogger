class Blog < ApplicationRecord

	acts_as_taggable_on :tags
  	acts_as_taggable_on :blog


	has_many :comments, dependent: :destroy
	has_many :likes , dependent: :destroy
	has_many :user_blog_visits ,class_name:"UserVisitBlog", dependent: :destroy
	has_many :comment_replies, dependent: :destroy
	belongs_to :master_categories ,class_name:"MasterCategory"
	belongs_to :user
	has_rich_text :description
	has_one_attached :description

	
	validates :title, :description ,:master_categories_id, presence: true
	validates :title ,uniqueness: true
	validates :title , length: { minimum: 10 }

	validates_presence_of :title , :message => 'Please Enter title.'
end
