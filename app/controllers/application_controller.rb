class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    # session[:return_to]
    # redirect_url = stored_location_for(resource)
    # return redirect_url if redirect_url
    if resource.is_a?(User) && resource.has_role?(:admin)
      admin_users_path
    else
      user_root
    end
  end
end
