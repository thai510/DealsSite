class BusinessesController < ApplicationController
  before_filter :adminCheck
  before_filter :businessCheck, :only => [:business_change_password_view, :business_change_password_save]
  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @businesses }
    end
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    @business = Business.find(params[:id])
    @liveOffers = @business.offers.where(:live => 1);
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business }
    end
  end

  # GET /businesses/new
  # GET /businesses/new.json
  def new
    @business = Business.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business }
    end
  end

  # GET /businesses/1/edit
  def edit
    @business = Business.find(params[:id])
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(params[:business])
    @business.initial_password = gen_random_password 
    @business.password = @business.initial_password 
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render json: @business, status: :created, location: @business }
      else
        format.html { render action: "new" }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /businesses/1
  # PUT /businesses/1.json
  def update
    @business = Business.find(params[:id])

    respond_to do |format|
      if @business.update_attributes(params[:business])
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business = Business.find(params[:id])
    @business.destroy

    respond_to do |format|
      format.html { redirect_to businesses_url }
      format.json { head :ok }
    end
  end

  def gen_random_password(size = 8)
    chars = (('a'..'z').to_a + ('0'..'9').to_a + ('A'..'Z').to_a) - %w(i o 0 1 l 0)
    (1..size).collect{|a| chars[rand(chars.size)] }.join
  end

  def reset_password
    @business = Business.find(params[:id])
    @business.initial_password = gen_random_password
    @business.hashed_password = Business.encrypt_password(@business.initial_password,@business.salt)
    @business.save
    puts @business.initial_password
    #email will be sent to user as well
    redirect_to @business
  end

  def business_change_password_view
    @business = Business.find(session[:business_id])
  end

  def business_change_password_save
    @business = Business.find(session[:business_id])
     puts params[:old_password]
    if @business.old_password_check(params[:old_password]) 
    respond_to do |format|
      unless params[:business][:password].blank?
        if @business.update_attributes(params[:business])
          format.html { redirect_to b_cp_path, notice: 'Password was successfully updated.' }
          format.json { head :ok }
        else
          format.html { redirect_to b_cp_path, notice: 'Password was not updated. Please provide correct current password. New password
          must be between 6 and 20 characters, and the confirmation must match your new password.' }
          format.json { render json: @business.errors, status: :unprocessable_entity }
        end
        else
          format.html {redirect_to b_cp_path, :notice => 'Password was not updated. Please provide correct current password. New password
          must be between 6 and 20 characters, and the confirmation must match your new password.'}
        end
    end
    else
      redirect_to b_cp_path, :notice => 'Password was not updated. Please provide correct current password. New password
          must be between 6 and 20 characters, and the confirmation must match your new password.'
    end
  end
end
