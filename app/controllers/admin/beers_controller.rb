module Admin
  class BeersController < Admin::ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource

    def sync_catalog
      ::SyncBeerCatalogJob.perform_async
      redirect_to admin_beers_path
    end
  end
end
