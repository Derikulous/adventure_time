class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :page_not_found
  rescue_from ActionController::RoutingError, with: :page_not_found

  private

  def page_not_found
    flash[:error] = "Sorry, we couldn't find that page. Here's the home page"
    redirect_to root_path
  end

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to request.headers["Referer"] || root_path
  end
end
