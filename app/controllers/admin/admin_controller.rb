class Admin::AdminController < ApplicationController
  layout "admin"
  protect_from_forgery prepend: true
  before_action :authenticate_user!
  before_action :authenticate_role!



private

  def authenticate_role!
    unless current_user.is_team?
      redirect_to root_path, :flash => { :error => "Keine Berechtigung" }
    end
  end

end
