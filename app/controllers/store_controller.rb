class StoreController < ApplicationController
  def index
    @liveOffers = Offer.where(:live => 1)
  end

end
