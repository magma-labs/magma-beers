# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ActionController::API
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :authenticate_user!
      # skip_before_action :verify_authenticity_token, raise: false
      # protect_from_forgery with: :exception#, if: :verify_api

      # def verify_api
      #   params[:controller].split('/')[0] != 'devise_token_auth'
      # end

      # skip_before_action :autenticate_user!

      before_action :configure_permitted_parameters, if: :devise_controller?

      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
      end
    end
  end
end
