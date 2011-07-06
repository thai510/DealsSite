class DealBuildersController < ApplicationController
  # GET /deal_builders
  # GET /deal_builders.xml
  def index
    @deal_builders = DealBuilder.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deal_builders }
    end
  end

  # GET /deal_builders/1
  # GET /deal_builders/1.xml
  def show
    @deal_builder = DealBuilder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @deal_builder }
    end
  end

  # GET /deal_builders/new
  # GET /deal_builders/new.xml
  def new
    @deal_builder = DealBuilder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deal_builder }
    end
  end

  # GET /deal_builders/1/edit
  def edit
    @deal_builder = DealBuilder.find(params[:id])
  end

  # POST /deal_builders
  # POST /deal_builders.xml
  def create
    @deal_builder = DealBuilder.new(params[:deal_builder])

    respond_to do |format|
      if @deal_builder.save
        format.html { redirect_to(@deal_builder, :notice => 'Deal builder was successfully created.') }
        format.xml  { render :xml => @deal_builder, :status => :created, :location => @deal_builder }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @deal_builder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /deal_builders/1
  # PUT /deal_builders/1.xml
  def update
    @deal_builder = DealBuilder.find(params[:id])

    respond_to do |format|
      if @deal_builder.update_attributes(params[:deal_builder])
        format.html { redirect_to(@deal_builder, :notice => 'Deal builder was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @deal_builder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /deal_builders/1
  # DELETE /deal_builders/1.xml
  def destroy
    @deal_builder = DealBuilder.find(params[:id])
    @deal_builder.destroy

    respond_to do |format|
      format.html { redirect_to(deal_builders_url) }
      format.xml  { head :ok }
    end
  end
end
