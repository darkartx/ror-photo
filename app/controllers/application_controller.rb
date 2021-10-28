class ApplicationController < ActionController::API
  include ActiveStorage::SetCurrent

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  
  def render_not_found
    render json: {
      errors: [
        {
          title: 'Not found'
        }
      ]
    }, status: :not_found
  end
end
