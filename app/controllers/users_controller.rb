class UsersController < ApplicationController
  before_action :set_user, except: [:destroy]

  def index
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'The user has been updated correctly.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
