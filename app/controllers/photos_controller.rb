class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create 
    @photo = Photo.new photo_params
    if @photo.save
      redirect_to root_path, flash: {success: "Photo added"}
    else
      render 'new'
    end
  end
  
  def photo_params
    params.require(:photo).permit(:name, :url, :caption, :likes_count)
  end
end
