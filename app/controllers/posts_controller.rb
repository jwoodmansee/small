class PostsController < ApplicationController
	before_action :find_post, except: [:index, :new, :create]
  def index
  	@posts = current_user.posts
  end

  def show
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	if @post.save
  		redirect_to post_path(@post)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @post.update
  		redirect_to post_path(@post)
  	else
  		render :edit
  	end
  end

  def destroy
  	@post.destroy
  	redirect_to posts_path
  end

  private

  	def post_params
  		params.require(:post).permit(:title, :content, :user_id)
  	end

  	def find_posts
  		@post = Posts.find(params[:id])
  	end
end
