class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
    @post = Post.new
    @users = User.all
  end

  def show
    @posts = Post.all.order("created_at DESC")
    @users = User.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: "Post was successfully created." }
      else
        @posts = Post.all.order("created_at DESC")

        format.html { render :index }
      end
    end
  end

  def edit
    @posts = Post.all
    @user = User.all
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to root_path, notice: "Post was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

   private

  def post_params
    params.require(:post).permit(:title, :description, :location, :category, :date,)
  end
end
