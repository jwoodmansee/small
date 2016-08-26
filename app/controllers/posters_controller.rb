class PostersController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	@posts = Post.all
  end

  def show
  	@posts = Post.all
  	@post = Post.find(params[:id])
  end
end
