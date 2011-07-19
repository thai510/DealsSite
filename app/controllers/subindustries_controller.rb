class SubindustriesController < ApplicationController


  # GET /subindustries
  # GET /subindustries.xml
  def index
    @subindustries = Subindustry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subindustries }
    end
  end

  # GET /subindustries/1
  # GET /subindustries/1.xml
  def show
    @subindustry = Subindustry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js {@currentIndustry = Industry.find(@subindustry.industry_id)}
      format.xml  { render :xml => @subindustry }
    end
  end

  # GET /subindustries/new
  # GET /subindustries/new.xml
  def new
    @subindustry = Subindustry.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subindustry }
    end
  end

  # GET /subindustries/1/edit
  def edit
    @subindustry = Subindustry.find(params[:id])
  end

  # POST /subindustries
  # POST /subindustries.xml
  def create
    @subindustry = Subindustry.new(params[:subindustry])
    respond_to do |format|
      if @subindustry.save
        format.html { redirect_to(industries_path, :notice => 'Subindustry was successfully created.') }
        format.xml  { render :xml => @subindustry, :status => :created, :location => @subindustry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subindustry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subindustries/1
  # PUT /subindustries/1.xml
  def update
    @subindustry = Subindustry.find(params[:id])

    respond_to do |format|
      if @subindustry.update_attributes(params[:subindustry])
        format.html { redirect_to(@subindustry, :notice => 'Subindustry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subindustry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subindustries/1
  # DELETE /subindustries/1.xml
  def destroy
    @subindustry = Subindustry.find(params[:id])
    @subindustry.destroy

    respond_to do |format|
      format.html { redirect_to(subindustries_url) }
      format.xml  { head :ok }
    end
  end
end