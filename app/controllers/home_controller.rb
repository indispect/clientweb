require "net/http"
require "uri"

class HomeController < ApplicationController
  protect_from_forgery
  
  def index
    
    session[:oauth] = Koala::Facebook::OAuth.new(FB_APP_ID, '67ed7e25657a5142b57a33c564cb833d', APP_DOMAIN + '/home/callback')
      @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream")  
      puts session.to_s + "<<< session"
    
    
    respond_to do |format|
       format.html {  }
    end    
  end
  
  def callback
    url_access_token = session[:oauth].url_for_access_token(params[:code])
    puts params[:code] + " <<< code"
    puts url_access_token + "<<< url"
    
    if params[:code]
      # acknowledge code and get access token from FB
      session[:access_token] = session[:oauth].get_access_token(params[:code])
    end
     # auth established, now do a graph call:

    #@api = Koala::Facebook::API.new(session[:access_token])
    #begin
    #  @graph_data = @api.get_object("/me/statuses", "fields"=>"message")
    #rescue Exception=>ex
    #  puts ex.message
    #end
    

    uri = URI.parse(INDISPECT_SERVER+'/set_fb_user?token='+session[:access_token])

    # Shortcut
    response = Net::HTTP.get_response(uri)

    puts response.to_s + "<< response"
    respond_to do |format|
     format.html {   }       
    end


  end
    
end
