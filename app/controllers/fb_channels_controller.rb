class FbChannelsController < ApplicationController
  @app_id = '341812065894310'
  # GET /fb_channels
  # GET /fb_channels.json
  def index
    @fb_channels = FbChannel.all
      @_dialog_url = "http://www.facebook.com/dialog/oauth?client_id=" 
        $app_id "&redirect_uri=" request.url "&state="
        session[:secret]
    if params[:code].empty?
      
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fb_channels }
    end
  end

  # GET /fb_channels/1
  # GET /fb_channels/1.json
  def show
    @fb_channel = FbChannel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fb_channel }
    end
  end

  # GET /fb_channels/new
  # GET /fb_channels/new.json
  def new
    @fb_channel = FbChannel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fb_channel }
    end
  end

  # GET /fb_channels/1/edit
  def edit
    @fb_channel = FbChannel.find(params[:id])
  end

  # POST /fb_channels
  # POST /fb_channels.json
  def create
    @fb_channel = FbChannel.new(params[:fb_channel])

    respond_to do |format|
      if @fb_channel.save
        format.html { redirect_to @fb_channel, notice: 'Fb channel was successfully created.' }
        format.json { render json: @fb_channel, status: :created, location: @fb_channel }
      else
        format.html { render action: "new" }
        format.json { render json: @fb_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fb_channels/1
  # PUT /fb_channels/1.json
  def update
    @fb_channel = FbChannel.find(params[:id])

    respond_to do |format|
      if @fb_channel.update_attributes(params[:fb_channel])
        format.html { redirect_to @fb_channel, notice: 'Fb channel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fb_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fb_channels/1
  # DELETE /fb_channels/1.json
  def destroy
    @fb_channel = FbChannel.find(params[:id])
    @fb_channel.destroy

    respond_to do |format|
      format.html { redirect_to fb_channels_url }
      format.json { head :no_content }
    end
  end
end
