class HomeController < ApplicationController
  skip_before_filter :authorize
  def index
    @user = current_sign_up
  end

end
