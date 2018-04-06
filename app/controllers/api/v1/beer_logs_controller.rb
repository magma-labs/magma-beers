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

      def create
        @beerlog = current_user.beer_logs.new(beer_log_params)
        response = if @beerlog.save
                     { message: 'Created successfully!!' }
                   else
                     { message: @beerlog.errors.full_message.join }
                   end
        respond_with response
      end
    end
  end
end
