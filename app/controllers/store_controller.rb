class StoreController < ApplicationController
  before_filter :adminCheck
  def index
    @liveOffers = Offer.where(:live => 1)
  end

end
