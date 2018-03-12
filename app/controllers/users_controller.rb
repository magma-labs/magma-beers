class UsersController < ApplicationController
  before_action :user

  def index
  end

  def show
  end

  def update
    pass_params = password_params.to_h
    exist_pass_arg = pass_params.any? { |k, v| !v.empty? and !v.nil? }
    empty_pass_arg = pass_params.any? { |k, v| v.empty? or v.nil? }

    if exist_pass_arg and empty_pass_arg
      redirect_to edit_user_url, alert: "To update password, all password fields must be typed"
    elsif exist_pass_arg and !empty_pass_arg and !user.valid_password?(pass_params[:current_password])
      redirect_to edit_user_url, alert: "To update password, the current password filed must match with the password in the database"
    # Update user profile with password
    elsif exist_pass_arg and !empty_pass_arg and user.valid_password?(pass_params[:current_password])
      if user.update_attributes(user_params)
        bypass_sign_in(@user)
        redirect_to edit_user_url, flash: { success:  'The user profile and password have been updated correctly' }
      else
        render :edit, alert: user.errors.full_messages.join
      end
    # udpate without password if password params are not present.
    else
      if user.update_without_password(user_params)
        redirect_to edit_user_url, flash: { success:  'The user profile has been updated correctly.' }
      else
        render :edit, alert: user.errors.full_messages.join
      end
    end
  end

  def destroy
    sign_out user
    user.destroy
    redirect_to user_root_path
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

  def password_params
    # params[:user].select { |k, v| k.to_s.match(/password/) }
    params.require(:user).permit(
      :password,
      :password_confirmation,
      :current_password
    )
  end
end
