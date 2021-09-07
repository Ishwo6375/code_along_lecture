class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create!(user_params)
    render json: user, status: :created
  end

  def show
    user = find_user
    render json: user
  end

  def update
    user = find_user
    user.update(user_params)
    render json: user
  end

  def destroy
    user = find_user
    user.destroy
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :age)
  end

  def find_user
    User.find(params[:id])
  end

  def render_not_found
    render json: { error: "user not found" }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: { error: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end