class SessionsController < ApplicationController


  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |g|
      g.name = auth['info']['name']
      g.email = auth['info']['email']
      g.image = auth['info']['image']
    end

    session[:user_id] = @user.id

    render 'sessions/create'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
