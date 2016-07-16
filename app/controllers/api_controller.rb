class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  private

  def authenticated?
    authenticate_or_request_with_http_basic do |username, password|
      @current_user = User.find_by( name: username, password: password)
      @current_user.present?
    end
  end
end
