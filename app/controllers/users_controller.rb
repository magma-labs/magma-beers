class UsersController < ApplicationController
  before_action :user

  def index
  end

  def show
  end

  def update
    # udpate without password if password params are not present.
    if user.update_without_password(user_params)
      redirect_to edit_user_url, flash: { success:  'The user has been updated correctly.' }
      # user.update or update_atrributes if the password is present
      # bypass_sign_in(@user) update if the password has changed
    else
      flash[:alert] =  user.errors.full_messages.join
      render :edit
    end
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :name,
      :password,
      :photo
    )
  end
end
