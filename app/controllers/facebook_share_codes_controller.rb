class FacebookShareCodesController < ApplicationController
  skip_before_filter :authorize
  # GET /facebook_share_codes
  # GET /facebook_share_codes.xml
  def index
    @facebook_share_codes = FacebookShareCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @facebook_share_codes }
    end
  end

  # GET /facebook_share_codes/1
  # GET /facebook_share_codes/1.xml
  def show
    @facebook_share_code = FacebookShareCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @facebook_share_code }
    end
  end

  # GET /facebook_share_codes/new
  # GET /facebook_share_codes/new.xml
  def new
    @facebook_share_code = FacebookShareCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @facebook_share_code }
    end
  end

  # GET /facebook_share_codes/1/edit
  def edit
    @facebook_share_code = FacebookShareCode.find(params[:id])
  end

  # POST /facebook_share_codes
  # POST /facebook_share_codes.xml
  def create
    @facebook_share_code = FacebookShareCode.new(params[:facebook_share_code])

    respond_to do |format|
      if @facebook_share_code.save
        format.html { redirect_to(@facebook_share_code, :notice => 'Facebook share code was successfully created.') }
        format.xml  { render :xml => @facebook_share_code, :status => :created, :location => @facebook_share_code }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @facebook_share_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /facebook_share_codes/1
  # PUT /facebook_share_codes/1.xml
  def update
    @facebook_share_code = FacebookShareCode.find(params[:id])

    respond_to do |format|
      if @facebook_share_code.update_attributes(params[:facebook_share_code])
        format.html { redirect_to(@facebook_share_code, :notice => 'Facebook share code was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @facebook_share_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /facebook_share_codes/1
  # DELETE /facebook_share_codes/1.xml
  def destroy
    @facebook_share_code = FacebookShareCode.find(params[:id])
    @facebook_share_code.destroy

    respond_to do |format|
      format.html { redirect_to(facebook_share_codes_url) }
      format.xml  { head :ok }
    end
  end

  def checkAndValidateFBCode
    if FacebookShareCode.authenticate(params[:typed_fb_code],params[:db_id])
      session[:fb_allow] = 1;
    else
      session[:fb_allow] = nil;
    end
    respond_to do |format|
      format.html { redirect_to purchase_session_new_path(:id => (@db_publish_id = params[:db_id])) }
    end
  end
end
