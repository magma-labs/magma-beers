class UsersController < ApplicationController
  before_action :autenticate_user, unles: :verify_api
  wrap_parameters :user, include: [:email, :password]

  def index
  end

  def show
  end

  def update
    if is_password_data_error?
      message = { alert: get_password_error_message }
    else
      message = is_password_present? ? update_with_pass : update_without_pass
    end

    redirect_to edit_user_url, flash: message
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
    params.require(:user).permit(
      :password,
      :password_confirmation,
      :current_password
    )
  end

  def exist_any_password_argument?
    password_params.to_h.any? { |k, v| !v.empty? and !v.nil? }
  end

  def exist_empty_password_argumenet?
    password_params.to_h.any? { |k, v| v.empty? or v.nil? }
  end

  def match_password_fields?
    password_params["password"] == password_params["password_confirmation"]
  end

  def is_correct_current_password?
    user.valid_password?(password_params["current_password"])
  end

  def is_password_data_error?
    exist_any_password_argument? and (exist_empty_password_argumenet? or !match_password_fields? or !is_correct_current_password?)
  end

  def is_password_present?
    exist_any_password_argument? && !exist_empty_password_argumenet? && match_password_fields? && is_correct_current_password?
  end

  def get_password_error_message
    if exist_empty_password_argumenet?
      return "To update password, all password fields must be typed"
    elsif !match_password_fields?
      return "To update password, password and password_confirmation fields must match"
    end
    "To update password, the current password field must match with the password in the database"
  end

  def update_with_pass
    if user.update_attributes(user_params)
      bypass_sign_in(@user)
      return { success: 'The user profile and password have been updated correctly' }
    end
    { alert: user.errors.full_messages.join }
  end

  def update_without_pass
    if user.update_without_password(user_params)
      return { success: 'The user profile has been updated correctly.' }
    end
    { alert: user.errors.full_messages.join }
  end
end
