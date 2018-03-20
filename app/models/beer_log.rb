class BeerLog < ApplicationRecord
  validates :quantity, :beer_id, :presence => true

  belongs_to :user
  belongs_to :beer

  scope :by_user, ->(user) { where(user_id: user) }
  scope :by_beer, ->(beer) { where(beer_id: beer) }
end
