class LearningCenterController < ApplicationController
  def index
  end
  
  def run_a_deal
  end

  def getting_started
  end

  def which_provider
  end

  def profit_drivers
  end
 
  def offer_structure
  end

  def before_and_during
  end

  def follow_up
  end
 
  def ask_a_question
    @feedback = Feedback.new
  end

end
