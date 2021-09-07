class ImagesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

 def index
  images = Image.all
  render json: images
 end

  def create
    image = Image.create!(image_params)
    render json: image
  end

  def show
    image = find_image
    render json: image
  end

  def update
    image = find_image
    image.update(image_params)
    render json: image
  end

  def destroy
    image = find_image
    image.destroy
    head :no_content
  end

   private

  def image_params
    params.require(:image).permit(:title, :description, :image_url, :user_id)
  end

  def find_image
    Image.find(params[:id])
  end

  def render_not_found
    render json: { error: "image not found" }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: { error: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
