# frozen_string_literal: true

module Api
  module V1
    class UsersController < ::UsersController
      respond_to :json
    end
  end
end
