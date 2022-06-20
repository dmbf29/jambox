class UsersController < ApplicationController
  include Devise::Controllers::Rememberable
  skip_before_action :authenticate_user!, only: [:spotify]
  skip_after_action :verify_authorized, only: [:spotify]

  def spotify
    user = User.find_for_spotify_oauth(request)
    if user.persisted?
      remember_me(user)
      sign_in_and_redirect user, event: :authentication
      flash[:notice] = "Signed in with Spotify"
    else
      session['devise.spotify_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
