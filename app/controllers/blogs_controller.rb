class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]
  before_action :set_category, only: %i[ new edit create ]



  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all.limit(3)  
  end

  def my_blogs
    if current_user != nil
    @blogs = Blog.where(user_id: current_user.id).order(created_at: :desc)
    end
  end 




  # GET /blogs/1 or /blogs/1.json
  def show
    if current_user != nil
    @likes = Like.find_by(user_id: current_user.id, blog_id: params[:id])
    @user = current_user.id
      end

      blog_visits(@blog.id)

    #fetch latest in index page 
    @latest = Blog.order(id: :desc).limit(3)

    #fetch recent viewed 
    if current_user != nil
    @viewed = UserVisitBlog.where(user_id: current_user.id).order(created_at: :desc).limit(3)
    end 
    

    @comment_replies = @blog.comment_replies.pluck(:comment_id)
    @allcomments = @blog.comments
    @comments = @allcomments.where.not(id: @comment_replies)
    
  end

  #categories list

  def categories_blog_list
    #fetch categories list from database
    @categories = MasterCategory.all

    #fetch blog based on categories 
    @cat_blog = Blog.where(master_categories_id: params[:cat_id]).order(created_at: :desc)
  end


 
  # GET /blogs/new
  def new
    @blog = Blog.new

  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    @user = current_user
    @blog = @user.blogs.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog) }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def blog_visits(blog_id)  
      if current_user == nil  
          count_visit(blog_id)
      else
          @validate_visit = UserVisitBlog.find_by(blog_id: blog_id , user_id: current_user.id)

          if @validate_visit == nil
          @user_blog_visit = UserVisitBlog.new(blog_id: blog_id , user_id: current_user.id)
          @user_blog_visit.save!
          end 
      end 


  end

  #This function use for count the blog visit.
  def count_visit(blog_id)
          @visit_count = Blog.find(blog_id)
          count = @visit_count.visit_count
          @visit_count.visit_count =  count+=1  
          @visit_count.save!
  end


    def set_category
       @categories = MasterCategory.all

    end
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title , :description,:master_categories_id,:tag_list)
    end
end
