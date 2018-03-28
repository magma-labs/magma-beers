class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :get_user_avatar
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.has_role?(:admin)
      admin_users_path
    else
      user_root_path
    end
  end

  def get_user_avatar
    if current_user
      @usr_avatar = (
        (current_user.photo && !current_user.photo.url.match('missing')) &&
        current_user.photo.url(:thumb) || "#{current_user.image}?type=large")
      @usr_avatar = !@usr_avatar.present? && @usr_avatar || current_user.photo.url(:thumb)
    end
  end

  rescue_from ActionController::RoutingError do |exception|
    logger.error 'Routing error ocurred'
    logger.error exception.message
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
