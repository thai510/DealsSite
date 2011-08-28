class HomeController < ApplicationController
  before_filter :finished_step_zero?

  def index
  end

end
