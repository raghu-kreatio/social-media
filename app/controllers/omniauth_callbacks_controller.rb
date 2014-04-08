class OmniauthCallbacksController < Devise::OmniauthCallbacksController


   def facebook     
     @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)      
     if @user.persisted?       
      redirect_to register_path(@user)
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_register_path
    end
  end

  def google_oauth2
     
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
 
    if @user.persisted?
    	flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
     redirect_to register_path(@user),:event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_register_path
    end
  end

end