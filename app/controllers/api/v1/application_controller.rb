# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ActionController::Base
      include DeviseTokenAuth::Concerns::SetUserByToken
      # skip_before_action :verify_authenticity_token, only: :create
      # protect_from_forgery with: :exception, if: :verify_api

      # def verify_api
      #   params[:controller].split('/')[0] != 'devise_token_auth'
      # end
    end
  end
end
