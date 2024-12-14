class ClientsController < ApplicationController
  require 'json'
 
  def login_marketforms
    if session[:client_token].present?
      xyz = server_response
      if xyz.code == '401'
        get_refresh_token
        redirect_to "http://localhost:3000/sso_login?access_token=#{session[:client_token]}" 
      end
    else
      redirect_to oauth_authorize_url
    end
  end

  private

  def oauth_authorize_url
    server_base_url = ENV['server_base_url']
    client_id = ENV['oauth_token']
    redirect_uri = ENV['oauth_redirect_uri']
    response_type = 'code'
    user_email = current_user.email

    "http://localhost:3000/oauth/authorize?client_id=MkwcJq6kIfVasWscd8FRi1K18dvctcQBf_gXuOoPqBw&redirect_uri=http%3A%2F%2Flocalhost%3A3001%2Fcallback&response_type=code&scope="
  end

  def server_response
    url = URI.parse("http://localhost:3000/sso_login?access_token=#{session[:client_token]}")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url.path)
    # request['Authorization'] = "Bearer #{session[:client_token]}"
    http.request(request)
  end

  def get_refresh_token
    token_url = 'http://localhost:3000/oauth/token'
    new_token = RestClient.post(
      token_url,
      grant_type: 'refresh_token',
      refresh_token: session[:refresh_token],
      client_id: ENV['oauth_token'],
      client_secret: ENV['oauth_secret']
    )
    token_data = JSON.parse(new_token.body)
    session[:client_token] = token_data['access_token']
    session[:refresh_token] = token_data['refresh_token']
    session[:client_app_token] = token_data
  end
end
