# Be sure to restart your server when you modify this file.

# This file contains settings for ActionController::ParamsWrapper which
# is enabled by default.
class UsersController < ApplicationController
  wrap_parameters format: [:json, :xml, :url_encoded_form, :multipart_form], include: [:username, :password]
end

# Enable parameter wrapping for JSON. You can disable this by setting :format to an empty array.
ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: [:json]
end

# To enable root element in JSON for ActiveRecord objects.
# ActiveSupport.on_load(:active_record) do
#   self.include_root_in_json = true
# end
