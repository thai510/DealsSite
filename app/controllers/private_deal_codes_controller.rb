class PrivateDealCodesController < ApplicationController

  helper_method :get_new_private_code
  # GET /private_deal_codes
  # GET /private_deal_codes.xml
  def index
    @private_deal_codes = PrivateDealCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @private_deal_codes }
    end
  end

  # GET /private_deal_codes/1
  # GET /private_deal_codes/1.xml
  def show
    @private_deal_code = PrivateDealCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @private_deal_code }
    end
  end

  # GET /private_deal_codes/new
  # GET /private_deal_codes/new.xml
  def new
    @private_deal_code = PrivateDealCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @private_deal_code }
    end
  end

  # GET /private_deal_codes/1/edit
  def edit
    @private_deal_code = PrivateDealCode.find(params[:id])
  end

  # POST /private_deal_codes
  # POST /private_deal_codes.xml
  def create
    @private_deal_code = PrivateDealCode.new(params[:private_deal_code])

    respond_to do |format|
      if @private_deal_code.save
        format.html { redirect_to(private_deal_codes_path(:id => @private_deal_code.db_publish_id),
            :notice => 'Private deal code was successfully created.') }
        format.xml  { render :xml => @private_deal_code, :status => :created, :location => @private_deal_code }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @private_deal_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /private_deal_codes/1
  # PUT /private_deal_codes/1.xml
  def update
    @private_deal_code = PrivateDealCode.find(params[:id])

    respond_to do |format|
      if @private_deal_code.update_attributes(params[:private_deal_code])
        format.html { redirect_to(@private_deal_code, :notice => 'Private deal code was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @private_deal_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /private_deal_codes/1
  # DELETE /private_deal_codes/1.xml
  def destroy
    @private_deal_code = PrivateDealCode.find(params[:id])
    @db_publish_id = @private_deal_code.db_publish_id
    @private_deal_code.destroy

    respond_to do |format|
      format.html { redirect_to(private_deal_codes_url(:id => @db_publish_id)) }
      format.xml  { head :ok }
    end
  end

  def get_new_private_code
    @pCode = ActiveSupport::SecureRandom.hex(6)
      until PrivateDealCode.find_by_code(@pCode).nil?
        @pCode = ActiveSupport::SecureRandom.hex(6)
      end
      return @pCode
  end
end
