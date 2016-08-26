class PostersController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	@posts = Post.all.paginate(:page => params[:page], :per_page => 3)
  end

  def show
  	@posts = Post.all.paginate(:page => params[:page], :per_page => 3)
  	@post = Post.find(params[:id])
  end
end
