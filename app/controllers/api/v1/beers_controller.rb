# frozen_string_literal: true

module Api
  module V1
    class BeersController < Api::V1::ApplicationController
      respond_to :json

      def index
        beers = Beer.all.limit(10)
        respond_with(beers)
      end
    end
  end
end
