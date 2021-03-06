class OffersController < ApplicationController
before_filter :adminCheck, :except => :live #except live will go here
  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offers }
    end
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @offer = Offer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @offer }
    end
  end

  # GET /offers/new
  # GET /offers/new.json
  def new
    @offer = Offer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @offer }
    end
  end

  # GET /offers/1/edit
  def edit
    @offer = Offer.find(params[:id])
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(params[:offer])
    #for live value meanings see offer model
    @offer.live = 0;
    if params[:start_offer_now] == 'yes'
      @offer.live = 1; #this offer is live now
      @offer.start_date = Time.at(Time.now.utc + Time.zone_offset('PDT'))
    end
    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render json: @offer, status: :created, location: @offer }
      else
        format.html { render action: "new" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /offers/1
  # PUT /offers/1.json
  def update
    @offer = Offer.find(params[:id])

    respond_to do |format|
      if @offer.update_attributes(params[:offer])
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to offers_url }
      format.json { head :ok }
    end
  end

  def stop_offer
    @offer = Offer.find(params[:id])
    @offer.live = 2
    #for now
    @offer.expiration_date = Time.at(Time.now.utc + Time.zone_offset('PDT'))
    @offer.save
    respond_to do |format|
      format.html { redirect_to Business.find(@offer.business_id) }
      format.json { head :ok }
    end
  end

  def start_offer
    @offer = Offer.find(params[:id])
    @offer.live = 1
    #for now
    @offer.start_date = Time.at(Time.now.utc + Time.zone_offset('PDT'))
    @offer.save
    respond_to do |format|
      format.html { redirect_to Business.find(@offer.business_id) }
      format.json { head :ok }
    end
  end

  def live
    @offer = Offer.find(params[:id])
    @voucher = Voucher.new
    if @offer.live != 1 && !isAdmin? 
      redirect_to root_path
    end
    respond_to do |format|
      format.html # live.html.erb
      format.json { render json: @offer }
    end
  end
  def thankyou
    @offer = Offer.find(params[:id])
    if params[:v]
      @voucher = Voucher.find(params[:v])
    end
  end

end
