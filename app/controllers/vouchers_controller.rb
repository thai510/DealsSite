class VouchersController < ApplicationController
  skip_before_filter :authorize 
  # GET /vouchers
  # GET /vouchers.xml
  def index
    @vouchers = Voucher.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vouchers }
    end
  end

  # GET /vouchers/1
  # GET /vouchers/1.xml
  def show
    @voucher = Voucher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @voucher }
    end
  end

  # GET /vouchers/new
  # GET /vouchers/new.xml
  def new
    @voucher = Voucher.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @voucher }
    end
  end

  # GET /vouchers/1/edit
  def edit
    @voucher = Voucher.find(params[:id])
  end

  # POST /vouchers
  # POST /vouchers.xml
  def create
    @voucher = Voucher.new(params[:voucher])

    respond_to do |format|
      if @voucher.save
        incrementVouchersSold(@voucher)
        format.html { redirect_to(@voucher,:notice => 'Thank you for your purchase!') }
        format.xml  { render :xml => @voucher, :status => :created, :location => @voucher }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @voucher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vouchers/1
  # PUT /vouchers/1.xml
  def update
    @voucher = Voucher.find(params[:id])

    respond_to do |format|
      if @voucher.update_attributes(params[:voucher])
        format.html { redirect_to(vouchers_path, :notice => 'Voucher was successfully updated.') }
        format.xml  { head :ok }
        format.js   
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @voucher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vouchers/1
  # DELETE /vouchers/1.xml
  def destroy
    @voucher = Voucher.find(params[:id])
    @voucher.destroy

    respond_to do |format|
      format.html { redirect_to(vouchers_url) }
      format.xml  { head :ok }
    end
  end

  def incrementVouchersSold(voucher)
    if voucher.prev_publish_id.nil?
      @db_publish = DbPublish.find(voucher.db_publish_id)
      @db_publish.total_vouchers_sold += 1
      @db_publish.save
    else
      @prev_publish = PrevPublish.find(voucher.prev_publish_id)
      @prev_publish.total_vouchers_sold += 1
      @prev_publish.save
    end
  end



end
