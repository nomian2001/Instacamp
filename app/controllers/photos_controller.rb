class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create 
    @photo = Photo.create(photo_params)
    
    if @photo.valid?
      flash[:success] = "Photo posted"
    else
      flash[:error] = "Error: #{@photo.errors.full_messages.to_sentence}"
    end
      redirect_to root_path
  end

  def edit
    @photo = Photo.find_by_id(params[:id])
  end

  def update
    @photo = Photo.find_by_id(params[:id])

    if @photo.update(photo_params)
      redirect_to @photo
    else
      render "edit"
    end
  end

  def show
    redirect_to root_path
  end

  def destroy
    @photo = Photo.find_by_id(params[:id])
    @photo.destroy
    redirect_to root_path
  end

  def photo_params
    params.require(:photo).permit(:username, :url, :caption, :likes_count)
  end
end
