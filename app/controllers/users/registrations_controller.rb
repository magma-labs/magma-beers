# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def create
      build_resource(sign_up_params)

      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          flash[:notice] = I18n.t(
            'devise.registrations.signed_up_but_unconfirmed'
          )
          expire_data_after_sign_in!
          redirect_to new_user_session_path
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end
  end
end
