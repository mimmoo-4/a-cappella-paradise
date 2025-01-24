class SessionsController < ApplicationController

  #サインイン後にマイページに遷移
  def after_sign_in_path_for(resource)
    member_path(current_member.id)
  end
end
