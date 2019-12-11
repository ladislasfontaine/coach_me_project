class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    
    @user = User.from_facebook(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      flash[:notice] = 'Connexion réussie !'
    else
      session['devise.facebook'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end