module Users
  class SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token, only: :create, raise: false

    def create
      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      redirect_to(after_sign_in_path_for(resource))
    end
  end
end
