class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
  end

  def edit
  end

  def update
    service = UpdatePermissionsService.call(@user, params.dig(:user, :permissions))
    respond_to do |format|
      if service.success?
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :permissions)
    end
end
