class ApplicationController < ActionController::Base
  before_filter :set_user
  protect_from_forgery

  # TODO: implement to come from Social Network abstraction API
  def set_user
    @current_user_id = 28125600
  end

end
