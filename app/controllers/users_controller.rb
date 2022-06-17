class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:spotify]

  def spotify
    user = User.find_for_spotify_oauth(request)
    if user.persisted?
      remember_me(user)
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
