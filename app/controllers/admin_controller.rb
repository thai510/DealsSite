class AdminController < ApplicationController
    before_filter :admin_authorize
  def index
  end

end
