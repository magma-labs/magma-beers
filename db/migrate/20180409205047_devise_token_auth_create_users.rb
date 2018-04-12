# frozen_string_literal: true

class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[5.1]
  def change
    ## Recoverable
    add_column :users, :allow_password_change, :boolean, default: false

    ## Tokens
    add_column :users, :tokens, :json
  end
end
