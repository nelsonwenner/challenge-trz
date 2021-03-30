class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
  def not_found(exception)
    render status: 404, json: {errors: exception.model + ' not found' }.to_json
  end
end
