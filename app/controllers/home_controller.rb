class HomeController < ApplicationController
require 'uri'
require 'restclient'
  def index
  end

  def gitcheck

    end

def home
  params = {'requestUri' => request.url, 'postBody' => request.post? ? request.raw_post : URI.parse(request.url).query }
  url = "https://www.googleapis.com/identitytoolkit/v1/relyingparty/verifyAssertion?key=AIzaSyDn47xvodDSO2Vt_G3Ozj95mKDIO_Fkdxk"
begin
  api_response = RestClient.post(url, params.to_json, :content_type => :json )
  verified_assertion = JSON.parse(api_response)
   if verified_assertion.include? "verifiedEmail"
      puts "verified"
      
    session[:email]=verified_assertion['verifiedEmail']
      redirect_to "/home_check" 
   end
   rescue
  puts "Not Verified"
  debugger
  render "home/gitcheck"

end

def login

end

def logout

end

def signup

end

def userStatus

end

def ok
end

def check

end


end

end
