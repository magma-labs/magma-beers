# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def create
      build_resource(sign_up_params)
      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          response_for_active(resource)
        else
          response_for_unactive
        end
      else
        response_for_unpersisted(resource)
      end
    end

    private

    def response_for_active(resource)
      set_flash_message! :notice, :signed_up
      sign_up(resource_name, resource)
      respond_with resource, location: after_sign_up_path_for(resource)
    end

    def response_for_unactive
      flash[:notice] = I18n.t('devise.registrations.signed_up_but_unconfirmed')
      expire_data_after_sign_in!
      redirect_to new_user_session_path
    end

    def response_for_unpersisted(resource)
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
end
