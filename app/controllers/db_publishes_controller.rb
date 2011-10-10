class DbPublishesController < ApplicationController
  before_filter :authorize, :except => :show
  helper_method :show_private_deal
  helper_method :checkAndCreateFBShareCode
  # GET /db_publishes
  # GET /db_publishes.xml
  def index
    @db_publishes = DbPublish.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @db_publishes }
    end
  end

  # GET /db_publishes/1
  # GET /db_publishes/1.xml
  def show
    @db_publish = DbPublish.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @db_publish }
    end
  end

  # GET /db_publishes/new
  # GET /db_publishes/new.xml
  def new
    @db_publish = DbPublish.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @db_publish }
    end
  end

  # GET /db_publishes/1/edit
  def edit
    @db_publish = DbPublish.find(params[:id])
  end

  # POST /db_publishes
  # POST /db_publishes.xml
  def create
    @db_publish = DbPublish.new(params[:db_publish])

    respond_to do |format|
      if @db_publish.save
        format.html { redirect_to(deal_builder_path(DealBuilder.find(@db_publish.deal_builder_id))) }
        format.xml  { render :xml => @db_publish, :status => :created, :location => @db_publish }
      else
        format.html { render :action => "new" ,:object => (@deal_builder_id = @db_publish.deal_builder_id)}
        format.xml  { render :xml => @db_publish.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /db_publishes/1
  # PUT /db_publishes/1.xml
  def update
    @db_publish = DbPublish.find(params[:id])

    respond_to do |format|
      if @db_publish.update_attributes(params[:db_publish])
        format.html { redirect_to(edit_deal_builder_path(DealBuilder.find(@db_publish.deal_builder_id))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit",:object => (@deal_builder_id = @db_publish.deal_builder_id) }
        format.xml  { render :xml => @db_publish.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /db_publishes/1
  # DELETE /db_publishes/1.xml
  def destroy
    @db_publish = DbPublish.find(params[:id])
    @current_db = DealBuilder.find(@db_publish.deal_builder_id)
    @restrictions = String.new
    @new_past_publish = PrevPublish.new do |pp|
      pp.total_vouchers_sold = @db_publish.total_vouchers_sold
      pp.max_number_of_vouchers = @db_publish.max_vouchers_to_sell
      pp.start_of_deal = @db_publish.created_at
      pp.offer_title = @current_db.db_step_one.offer_title
      pp.offer_description = @current_db.db_step_one.offer_description
      pp.offer_value = @current_db.db_step_one.offer_value
      pp.offer_price = @current_db.db_step_one.offer_price
      pp.address = @current_db.db_step_two.locations[0].address
      pp.city = @current_db.db_step_two.locations[0].city
      pp.state = @current_db.db_step_two.locations[0].state
      pp.zip = @current_db.db_step_two.locations[0].zip
      pp.coupon = @current_db.db_step_one.coupon 
      pp.private_deal = @db_publish.private_deal
      if @current_db.fb_incentive == 'yes' 
        pp.fb_incentive = @current_db.fb_incentive_text
      end
      pp.all_locations = @current_db.db_step_two.include_all
      @current_db.db_step_three.standard_restrictions.each do |s_r|
        @restrictions += s_r.description + ' '
      end
      @restrictions += @current_db.db_step_three.optional_restriction
      pp.restrictions = @restrictions
      pp.incentive_ideas = @current_db.db_step_four.optional_incentive
      pp.voucher_length = @current_db.db_step_three.voucher_length

      pp.user_id = session[:users_id]
    end
    @new_past_publish.save
    @db_publish.vouchers.each do |voucher| #deal is over so give voucher access to past deal info
        voucher.prev_publish_id = @new_past_publish.id
        voucher.save
    end
    @db_publish.destroy

    respond_to do |format|
      format.html { redirect_to( @current_db ) }
      format.xml  { head :ok }
    end
  end

  def show_private_deal(db_publish_id)
    unless User.find(DealBuilder.find(DbPublish.find(db_publish_id).deal_builder_id).user_id)  == current_user || bool_admin_authorize 
       if session[:pdc]
        if PrivateDealCode.find_by_code(session[:pdc]).db_publish_id == db_publish_id 
         return true
        end
       end
      redirect_to private_url,:notice => 'Offer requires code to access'
    end
    return true
  end

  def checkAndCreateFBShareCode
    @four = DealBuilder.find(@db_publish.deal_builder_id).db_step_four
    if @four.fb_incentive == 'yes' #there is a fb incentive on this deal!
      @newCode = ActiveSupport::SecureRandom.hex(3)
      until FacebookShareCode.find_by_code(@newCode).nil? #make sure code isn't being used
        @newCode = ActiveSupport::SecureRandom.hex(3)
      end
      @newFbShare = FacebookShareCode.new #make new FBshare object
      @newFbShare.db_publish_id = @db_publish.id
      @newFbShare.code = @newCode
      @newFbShare.save
      return @newCode #return the code to be shown to the customer
    end
    return false
  end
  
end
