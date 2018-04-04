# frozen_string_literal: true

module Api
  module V1
    class BeersController < ::BeersController
      respond_to :json

      def index
        super
        respond_with @beers
      end
    end
  end
end
