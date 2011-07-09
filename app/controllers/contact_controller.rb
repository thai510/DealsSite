class ContactController < ApplicationController
  skip_before_filter :authorize
  def contact_us
  end

end
