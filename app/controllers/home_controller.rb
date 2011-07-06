class HomeController < ApplicationController
  def index
    @user = current_sign_up
  end

end
