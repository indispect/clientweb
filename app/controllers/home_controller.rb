class HomeController < ApplicationController
  protect_from_forgery :secret => "123456789012345678901234567890..."
  
  def index
    
    put_s session[:secret] + "<<< secret"
    session[:oauth] = Koala::Facebook::OAuth.new(FB_APP_ID, session[:secret], APP_DOMAIN + '/home/callback')
      @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream")  
      puts session.to_s + "<<< session"
    
    
    respond_to do |format|
       format.html {  }
    end    
  end
  
  def callback
    if params[:code]
      # acknowledge code and get access token from FB
      session[:access_token] = session[:oauth].get_access_token(params[:code])
    end   

     # auth established, now do a graph call:

    @api = Koala::Facebook::API.new(session[:access_token])
    begin
      @graph_data = @api.get_object("/me/statuses", "fields"=>"message")
    rescue Exception=>ex
      puts ex.message
    end

  
    respond_to do |format|
     format.html {   }       
    end


  end
    
end
