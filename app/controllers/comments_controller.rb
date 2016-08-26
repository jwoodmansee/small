class CommentsController < ApplicationController
  before_action require: :user
  before_action :post
  before_action :comments, only: [:show, :edit, :update, :destroy]

  def index
    @comment = @post.comments
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment[:post_id] = params[:post_id]
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comments

    @comment = Comment.find(params[:id])

  end

  def post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
