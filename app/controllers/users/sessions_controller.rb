module Users
  class SessionsController < Devise::SessionsController
    # def new
    #   self.resource = resource_class.new(sign_in_params)
    #   store_location_for(resource, params[:redirect_to])
    #   super
    # end

    def create
      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      # respond_with resource, location: after_sign_in_path_for(resource)
      redirect_to(after_sign_in_path_for(resource))
    end
  end
end
