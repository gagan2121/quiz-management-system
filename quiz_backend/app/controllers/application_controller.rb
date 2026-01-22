class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session 
  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      rails_admin.dashboard_path
    else
      super
    end
  end


end