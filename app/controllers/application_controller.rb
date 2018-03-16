class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.has_role?(:admin)
      admin_users_path
    else
      user_root_path
    end
  end

  rescue_from ActionController::RoutingError do |exception|
    logger.error 'Routing error ocurred'
    logger.error exception.message
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
