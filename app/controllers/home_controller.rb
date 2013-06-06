class HomeController < ApplicationController
before_filter :oks,only: [:index]
before_filter :check_u, only: [:ok]

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
     session[:passwordt]="true"
      redirect_to "/home_check" 
   end
   rescue
  puts "Not Verified"
  render "home/gitcheck"
   end
 end




def login
   e=params[:email]
  p=params[:password]
  @a= User.find_by_email ("#{e}")
  if @a.nil?
     @status = 'passwordError'
  else
    
    s= User.find_by_password("#{e}")
    s=s.password
    if s==p
      @status = 'ok'
      session[:passwordt]="true"
    else
      @status ='passwordError'
    end

  end
  render :json => {'status' => @status}
end




def logout
reset_session
redirect_to "/"
end





def userStatus

 e=params[:email]
  @a= User.find_by_email ("#{e}")
  if @a.nil?
    @registered = false
  else
    @registered = true
  end
  render :json => {'registered' => @registered}
end






def ok

end



def check

end



end


