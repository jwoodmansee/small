class CommentsController < ApplicationController
  before_action require: :user
  before_action :post
  before_action :comments, only: [:show, :edit, :update, :destroy]

  def index
    @comment = @post.comment
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@post, @comment)
    else
      render :new
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
    redirect_to post_path(@post, @comment)
  end

  private

  def comemnt
    @comment = @post.comment
  end

  def post
    @post = Post.find(params[:post_id])
  end


end
