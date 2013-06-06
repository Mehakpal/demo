class ApplicationController < ActionController::Base
  protect_from_forgery


def check_u                   
  if session[:passwordt].nil?  
    redirect_to "/"          
  end                         
end                           
                        
def oks
 if session[:passwordt]=="true"  
  redirect_to "/ok"  
end
end


end
