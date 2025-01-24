# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  #サインイン後にマイページに遷移
  def after_sign_in_path_for(resource)
    member_path(current_member.id)
  end

  def after_sign_out_path_for(resource)
    new_member_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:nickname,:address,:furigana,:self_introduction,:main_part])
  end
end
