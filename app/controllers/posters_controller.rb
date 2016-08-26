class PostersController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	@posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).paginate(:page => params[:page], :per_page => 3)
    else
      @posts = Post.all.paginate(page: params[:page], per_page: 3)
    end
  end

  def show
  	@posts = Post.all.paginate(:page => params[:page], :per_page => 3)
  	@post = Post.find(params[:id])
  end

end
