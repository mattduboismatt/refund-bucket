class DealersController < ApplicationController
  allow_unauthenticated!

  def index
    @dealers = Dealer.search(params)
    @dealer_categories = Dealer::Categories::ALL
  end
end
