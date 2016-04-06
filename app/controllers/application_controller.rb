class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_request

  private

  def authenticate_request
    unless params[:auth_token].presence == ENV['API_TOKEN']
      render status: 403, json: error_message
    end
  end

  def error_message
    { error:
      {
        status: 403,
        message: 'Unauthorized request, please use a valid auth_token.'
      }
    }
  end
end
