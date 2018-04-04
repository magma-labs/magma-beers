# frozen_string_literal: true

module Api
  module V1
    class BeerLogsController < ::BeerLogsController
      respond_to :json

      def index
        super
        data = { plain_data: @pagination, grouped_data: @beerlogs }
        respond_with data
      end
    end
  end
end
