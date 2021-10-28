class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  # GET /users
  def index
    render jsonapi: User.all
  end

  # GET /users/1
  def show
    render jsonapi: @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
