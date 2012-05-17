class VouchersController < ApplicationController
  VOUCHER_LIMIT = 65535 #16 ^4 - 1 
  #customer uses voucher create, genCode
  # GET /vouchers
  # GET /vouchers.json
  before_filter :adminCheck, :except => [:create,:genCode,:update]
  before_filter :businessCheck, :only => [:update]
  def index
    @vouchers = Voucher.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vouchers }
    end
  end

  # GET /vouchers/1
  # GET /vouchers/1.json
  def show
    @voucher = Voucher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @voucher }
    end
  end

  # GET /vouchers/new
  # GET /vouchers/new.json
  def new
    @voucher = Voucher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @voucher }
    end
  end

  # GET /vouchers/1/edit
  def edit
    @voucher = Voucher.find(params[:id])
  end

  # POST /vouchers
  # POST /vouchers.json
  def create
    @voucher = Voucher.new(params[:voucher])
    @voucher.business_id = Offer.find(@voucher.offer_id).business_id
    #redeemed 0 for not redeemed, 1 for redeemed
    @voucher.redeemed = 0
    @voucher.code = genCode(@voucher.offer_id) 
    respond_to do |format|
      if @voucher.save
        if params[:email_list] == 'yes' && Customer.where(:email => @voucher.email).count == 0 
          @customer = Customer.new
          @customer.email = @voucher.email
          @customer.zip = '00000'
          @customer.cause = NonProfit.find(@voucher.non_profit_id).title
          @customer.save
        end
        Notifier.voucher_created(@voucher).deliver
        format.html { redirect_to thankyou_offer_path(@voucher.offer_id, :v => @voucher) }
        format.json { render json: @voucher, status: :created, location: @voucher }
      else
        format.html { render action: "../offers/live", 
           :object => @offer = Offer.find(@voucher.offer_id) }
        format.json { render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vouchers/1
  # PUT /vouchers/1.json
  def update
    @voucher = Voucher.find(params[:id])

    respond_to do |format|
      if @voucher.update_attributes(params[:voucher])
        format.html { redirect_to @voucher, notice: 'Voucher was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vouchers/1
  # DELETE /vouchers/1.json
  def destroy
    @voucher = Voucher.find(params[:id])
    @voucher.destroy

    respond_to do |format|
      format.html { redirect_to vouchers_url }
      format.json { head :ok }
    end
  end

  def genCode(offer_id)
    #this will probably never happen, but it's worth
    #checking
    count = Offer.find(offer_id).vouchers.count 
    if count >= VOUCHER_LIMIT 
     return nil
    end
    #convert to hex with 4 bits of padding
    begin
      code = rand(VOUCHER_LIMIT) 
      hex = "%04x" % code.to_s
      finalcode = offer_id.to_s + hex
    end while(Voucher.find_by_code(finalcode))
    #pad with 
    #get our Randoms
    return finalcode
  end
end
