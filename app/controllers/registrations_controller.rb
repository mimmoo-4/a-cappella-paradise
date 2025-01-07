class RegistrationsController < ApplicationController

  #サインアップ後にマイページに遷移
  def after_sign_up_path_for(resource)
    member_path(current_member.id)
  end

end
