# frozen_string_literal: true

require 'rails_helper'

describe SyncBeerCatalogJob, type: :job do
  it { is_expected.to be_processed_in :default }
end
