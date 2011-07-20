class SignUpController < ApplicationController
  skip_before_filter :authorize
  def index
     @user = current_sign_up
     @industriesCount = 0;
  end

end
