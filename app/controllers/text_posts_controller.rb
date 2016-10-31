class TextPostsController < ApplicationController
  # GET /text_posts
  def index
    # grabs all the text posts and assigns it to @text_posts
    @text_posts = TextPosts.all
  end

  # GET /text_posts/:id
  def show
    @text_post = TextPosts.find(params[:id])
  end

  # GET /text_posts/new
  def new

  end

  # GET /text_posts/:id/edit
  def edit
    @text_post = TextPosts.find(params[:id])
  end

  # POST /text_posts
  def create
    @text_post = TextPosts.new(text_post_params)
    if @text_post.save
      redirect_to text_posts_path
    else
      @errors = @text_post.errors
      render :new
    end
  end

  # PUT /text_posts/:id
  def update
    @text_post = TextPosts.find(params[:id])
    if @text_post.update(text_post_params)
      redirect_to text_posts_path
    else
      @errors = @text_post.errors
      render :edit
    end
  end

  # DELETE /text_posts/:id
  def delete
    @text_post = TextPosts.find(params[:id])
    @text_post.destroy
    redirect_to text_posts_path
  end

  private
    def text_post_params
      params.require(:text_post).permit(:title, :text)
    end
end
