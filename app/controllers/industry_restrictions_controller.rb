class IndustryRestrictionsController < ApplicationController
  # GET /industry_restrictions
  # GET /industry_restrictions.xml
  def index
    @industry_restrictions = IndustryRestriction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @industry_restrictions }
    end
  end

  # GET /industry_restrictions/1
  # GET /industry_restrictions/1.xml
  def show
    @industry_restriction = IndustryRestriction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @industry_restriction }
    end
  end

  # GET /industry_restrictions/new
  # GET /industry_restrictions/new.xml
  def new
    @industry_restriction = IndustryRestriction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @industry_restriction }
    end
  end

  # GET /industry_restrictions/1/edit
  def edit
    @industry_restriction = IndustryRestriction.find(params[:id])
  end

  # POST /industry_restrictions
  # POST /industry_restrictions.xml
  def create
    @industry_restriction = IndustryRestriction.new(params[:industry_restriction])

    respond_to do |format|
      if @industry_restriction.save
        format.html { redirect_to(@industry_restriction, :notice => 'Industry restriction was successfully created.') }
        format.xml  { render :xml => @industry_restriction, :status => :created, :location => @industry_restriction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @industry_restriction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /industry_restrictions/1
  # PUT /industry_restrictions/1.xml
  def update
    @industry_restriction = IndustryRestriction.find(params[:id])

    respond_to do |format|
      if @industry_restriction.update_attributes(params[:industry_restriction])
        format.html { redirect_to(@industry_restriction, :notice => 'Industry restriction was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @industry_restriction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /industry_restrictions/1
  # DELETE /industry_restrictions/1.xml
  def destroy
    @industry_restriction = IndustryRestriction.find(params[:id])
    @industry_restriction.destroy

    respond_to do |format|
      format.html { redirect_to(industry_restrictions_url) }
      format.xml  { head :ok }
    end
  end
end
