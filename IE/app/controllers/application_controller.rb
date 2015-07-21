class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def confirm_signned_in
     unless session[:usr_id]
     flash[:notice] = "Please signin."
     redirect_to(:controller => 'usr', :action => 'signin')
     return false
   else
     return true
   end
 end

end
