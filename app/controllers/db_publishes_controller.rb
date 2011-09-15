class DbPublishesController < ApplicationController
  before_filter :authorize, :except => :show
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
    @deal_builder_id = @db_publish.deal_builder_id
    @db_publish.destroy

    respond_to do |format|
      format.html { redirect_to(DealBuilder.find(@deal_builder_id)) }
      format.xml  { head :ok }
    end
  end
end
