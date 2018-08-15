class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def new
    if params[:back]
      @post = Post.new(content: params[:post][:content])
    else
      @post = Post.new
    end
  end 
 
  def confirm
    @post = Post.new(content: params[:post][:content])
    render :new if @post.invalid?
  end
  
  def create
  
    @post = Post.new(content: params[:post][:content])
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to posts_path
    else
      render new_post_path
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:post][:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to posts_path
    else
      render edit_post_path
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_path
  end
  
end

