class StandardRestrictionsController < ApplicationController
  # GET /standard_restrictions
  # GET /standard_restrictions.xml
  def index
    @standard_restrictions = StandardRestriction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @standard_restrictions }
    end
  end

  # GET /standard_restrictions/1
  # GET /standard_restrictions/1.xml
  def show
    @standard_restriction = StandardRestriction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @standard_restriction }
    end
  end

  # GET /standard_restrictions/new
  # GET /standard_restrictions/new.xml
  def new
    @standard_restriction = StandardRestriction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @standard_restriction }
    end
  end

  # GET /standard_restrictions/1/edit
  def edit
    @standard_restriction = StandardRestriction.find(params[:id])
  end

  # POST /standard_restrictions
  # POST /standard_restrictions.xml
  def create
    @standard_restriction = StandardRestriction.new(params[:standard_restriction])

    respond_to do |format|
      if @standard_restriction.save
        format.html { redirect_to(@standard_restriction, :notice => 'Standard restriction was successfully created.') }
        format.xml  { render :xml => @standard_restriction, :status => :created, :location => @standard_restriction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @standard_restriction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /standard_restrictions/1
  # PUT /standard_restrictions/1.xml
  def update
    @standard_restriction = StandardRestriction.find(params[:id])

    respond_to do |format|
      if @standard_restriction.update_attributes(params[:standard_restriction])
        format.html { redirect_to(@standard_restriction, :notice => 'Standard restriction was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @standard_restriction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /standard_restrictions/1
  # DELETE /standard_restrictions/1.xml
  def destroy
    @standard_restriction = StandardRestriction.find(params[:id])
    @standard_restriction.destroy

    respond_to do |format|
      format.html { redirect_to(standard_restrictions_url) }
      format.xml  { head :ok }
    end
  end
end
