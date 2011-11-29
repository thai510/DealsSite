class LoginController < ApplicationController
  skip_before_filter :authorize
  before_filter :alreadyLoggedIn

  def index
  end

  def alreadyLoggedIn
    if current_user
      redirect_to home_url
    end
  end

end
