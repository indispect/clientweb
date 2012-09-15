require "net/http"
require "uri"

class HomeController < ApplicationController
  protect_from_forgery
  
  def index
    
    session[:oauth] = Koala::Facebook::OAuth.new(FB_APP_ID, '67ed7e25657a5142b57a33c564cb833d', APP_DOMAIN + '/home/callback')
      @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"user_about_me,
      user_activities,user_birthday,user_checkins,user_education_history,user_events,user_groups,
      user_hometown,user_interests,user_likes,user_location,user_status,user_work_history,read_stream")  
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
      
      puts "HERE!!!"
      
      puts url_access_token.to_s + "!access token <<<<<<<<<<<<<<<<"
      # acknowledge code and get access token from FB
      session[:access_token] = url_access_token
    end
     # auth established, now do a graph call:

    #@api = Koala::Facebook::API.new(session[:access_token])
    #begin
    #  @graph_data = @api.get_object("/me/statuses", "fields"=>"message")
    #rescue Exception=>ex
    #  puts ex.message
    #end
    
    uri = URI.parse(INDISPECT_SERVER+'/login?appId='+CLIENTWEB_APP_ID+'&secret=' + CLIENTWEB_SECRET)

    puts uri.to_s + "   indis uri<<<<<<<<<<<<<<<"

    # Shortcut
    response = Net::HTTP.get_response(uri)
        
    data = response.body
        
    result = JSON.parse(data)
    
    uri = URI.parse(INDISPECT_SERVER+'/set_fb_user?fbToken='+session[:access_token]+'&indiToken='+result['indi_token'])
    
    response = Net::HTTP.get_response(uri)
    
    puts response.to_s + "<< response"
    
    uri = URI.parse(INDISPECT_SERVER+'/get_campaign')
    
    response = Net::HTTP.get_response(uri)
    
    respond_to do |format|
     format.html {   }       
    end


  end
    
end
