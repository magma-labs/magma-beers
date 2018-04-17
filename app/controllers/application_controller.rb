class ApplicationController < ActionController::Base
  before_action :get_user_avatar
  protect_from_forgery with: :exception, if: :verify_api
  respond_to :html, :json

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
        current_user.photo.url(:thumb) || current_user.image? &&
        "#{current_user.image}?type=large") || current_user.gravatar_url
    end
  end

  rescue_from ActionController::RoutingError do |exception|
    logger.error 'Routing error ocurred'
    logger.error exception.message
    render file: "#{Rails.root}/public/404", status: :not_found
  end

  def authenticate_current_user
    head :unauthorized if current_user_get.nil?
  end

  def current_user_get
    return nil unless cookies[:auth_headers]
    auth_headers = JSON.parse(cookies[:auth_headers])
    expiration_datetime = DateTime.strptime(auth_headers['expiry'], '%s')
    current_user = User.find_by(uid: auth_headers['uid'])
    if current_user &&
       current_user.tokens.key?(auth_headers['client']) &&
       expiration_datetime > DateTime.now
      @current_user = current_user
    end
    @current_user
  end

  def verify_api
    params[:controller].split('/')[0] != 'devise_token_auth'
  end

end
