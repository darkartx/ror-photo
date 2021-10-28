class PhotosController < ApplicationController  
  before_action :authenticate_user!
  before_action :set_photo, only: [:show, :update, :destroy]

  # GET /photos
  def index
    render jsonapi: Photo.all, fields: { 
        photos: [:title, :views, :created_at, :updated_at, :image_preview] 
    }
  end

  # GET /photos/1
  def show
    @photo.views += 1
    @photo.save
    # if stale?(@photo)
      render jsonapi: @photo
    # end
  end

  # POST /photos
  def create
    @photo = Photo.new(photo_create_params.except(:image_original))
    @photo.image_original.attach(data: photo_create_params[:image_original])

    if @photo.save      
      render jsonapi: @photo, status: :created
    else
      render jsonapi_errors: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update(photo_update_params)
      render jsonapi: @photo
    else
      render jsonapi_errors: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_create_params
      params.require(:_jsonapi).require(:photo).permit(:title, :image_original)
    end

    # Only allow a list of trusted parameters through.
    def photo_update_params
      params.require(:_jsonapi).require(:photo).permit(:title)
    end
end
