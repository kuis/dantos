class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action do
    if current_user && current_user.email == "cqpanxu@gmail.com"
      Rack::MiniProfiler.authorize_request
    end
  end

  protected

  def configure_permitted_parameters
    keys = %i(
      username
      bio
      first_name
      last_name picture
      headline
      work_experience
      gender
    )
    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
  end

end
