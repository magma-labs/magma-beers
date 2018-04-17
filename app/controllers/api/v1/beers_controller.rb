# frozen_string_literal: true

module Api
  module V1
    class BeersController < Api::V1::ApplicationController
      respond_to :json

      def index
        render json: {text: 'test'}
      end
    end
  end
end
