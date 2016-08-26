class PostsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show]
	before_action require: :user, except: [:index, :show]
	before_action :find_post, except: [:index, :new, :create]
  def index
  	# @posts = current_user.posts
  	@posts = Post.all
  end

  def show
  	@posts = Post.all
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
  	if @post.update(post_params)
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
  		params.require(:post).permit(:title, :teaser, :content, :user_id)
  	end

  	def find_post
  		@post = Post.find(params[:id])
  	end
end
