class ImagePostsController < ApplicationController
  before_action  :check_guest_user, only: [:new, :destroy]

  def new
      @site = Site.find(params[:site_id])    
      @image_post = @site.image_posts.build
  end

  def create
    @site ||= Site.find(params[:site_id])
    @image_post = @site.image_posts.build(image_post_params)
    @image_post.user_id = current_user.id
        
    if @image_post.save
      flash[:notice] ="create_image_post"
      redirect_to site_path(@site.id) 
    else
        byebug
      flash[:alert]="failed_create_image_post"
      redirect_to site_path(@site.id)
    end
  end

  def destroy
    @image_post = ImagePost.find(params[:id])
    @image_post.destroy
    redirect_to site_path(@image_post.site.id, anchor: "images"), notice: "delete_image_post"
  end   

  private
  def image_post_params
    params.require(:image_post).permit(:site_id, :image, :image_cache)
  end
end
