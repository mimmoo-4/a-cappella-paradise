class ApplicationController < ActionController::Base
  before_action :authenticate_member!, except: [:top], unless: :admin_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  #サインイン後にマイページに遷移
  def after_sign_in_path_for(resource)
    member_path(current_member.id)
  end

  private
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:nickname,:address,:furigana,:self_introduction,:main_part])
  end
end
