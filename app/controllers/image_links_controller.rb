class ImageLinksController < ApplicationController

  # GET /text_posts
  def index
    # instance variable holds all image links in an array
    @image_links = ImageLink.all
  end

  # GET /image_links/:id
  def show
    # grabs :id from the url params and uses that as the id
    @image_link = ImageLink.find(params[:id])
  end

  # GET /image_links/new
  def new

  end

  # GET /image_links/:id/edit
  def edit
    # grabs :id from the url params and uses that as the id
    @image_link = ImageLink.find(params[:id])
  end

  # POST /image_links
  def create
    @image_link = ImageLink.new(image_link_params)
    if @image_link.save
      redirect_to image_links_path
    else
      @errors = @image_link.errors
      render :new
    end
  end

  # PUT /image_links/:id
  def update
    @image_link = ImageLink.find(params[:id])
    if @image_link.update(image_link_params)
      redirect_to image_links_path
    else
      @errors = @image_link.errors
      render :edit
    end
  end

  # DELETE /image_links/:id
  def delete
    @image_link = ImageLink.find(params[:id])
    @image_link.destroy
    redirect_to image_links_path
  end

  private
    def image_link_params
      params.require(:image_link).permit(:url, :title)
    end
end
