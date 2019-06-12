class PostsController < ApplicationController
  before_action :require_logged_in

  def new
    @post = Post.new
    @subs = Sub.all
    render :new 
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.sub_ids = params[:post][:sub_ids]
    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new 
    end  
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = current_user.posts.find(params[:id])
    
    if @post.update_attributes(post_params)
      #something awesome
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end

  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    # redirect_to sub_url(@post.subs.first)
    redirect_to subs_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
