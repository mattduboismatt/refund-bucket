class DealersController < ApplicationController
  allow_unauthenticated!

  def index
    flash.now[:notice] = "Welcome!"
    @dealers = Dealer.all
  end
end
