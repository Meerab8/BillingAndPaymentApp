class SessionsController < ApplicationController
  require 'json'

  def create
    user_email = 'bitxpert1@gmail.com'
    req_params = "client_id=#{ENV['oauth_token']}&client_secret=#{ENV['oauth_secret']}&code=#{params[:code]}&grant_type=authorization_code&redirect_uri=#{ENV['oauth_redirect_uri']}&user_email=#{user_email}"
    response = RestClient.post("#{ENV['server_base_url']}/oauth/token", req_params)
    response1 = JSON.parse(response)
    session[:client_app_token] = response1
    session[:client_token] = response1['access_token']
    session[:refresh_token] = response1['refresh_token']
  
    redirect_to "http://localhost:3000/sso_login?access_token=#{session[:client_token]}"
  end

  private 

  def server_response
    url = URI.parse("http://localhost:3000/sso_login")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url.path)
    request['Authorization'] = "Bearer #{session[:client_token]}"
    http.request(request)
  end
end
