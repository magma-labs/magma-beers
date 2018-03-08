require 'rails_helper'

describe UsersController, type: :controller do
  let(:attr) do
    {
      :name => "Edgar1", :password => "",
      :password_confirmation => "", :current_password => ""
    }
  end
end
