# frozen_string_literal: true

module Api
  module V1
    class UsersController < ::UsersController
      wrap_parameters :user, include: [:email, :password]
      respond_to :json
    end
  end
end
