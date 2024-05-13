class ApplicationController < ActionController::Base
    before_action :check_admin

  private

  def check_admin
    if admin_signed_in?
      if !request.original_url.include?('admin') 
        flash[:alert] = "Debe cerrar sesión para acceder a esta ruta"
        redirect_to admin_root_path
      end
    elsif request.original_url.include?('admin') && request.path != new_admin_session_path
      flash[:alert] = "Debe iniciar sesión para acceder a esta ruta"
      redirect_to new_admin_session_path
    end
  end
end
