class DealersController < ApplicationController
  allow_unauthenticated!

  def index
    @dealers = Dealer.all
  end
end
