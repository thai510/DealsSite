class PrevPublishesController < ApplicationController
  # GET /prev_publishes
  # GET /prev_publishes.xml
  def index
    @prev_publishes = current_user.prev_publishes.paginate :page => params[:page], :per_page => 14, :order => 'created_at desc' 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prev_publishes }
    end
  end

  # GET /prev_publishes/1
  # GET /prev_publishes/1.xml
  def show
    @prev_publish = PrevPublish.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prev_publish }
    end
  end

  # GET /prev_publishes/new
  # GET /prev_publishes/new.xml
  def new
    @prev_publish = PrevPublish.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prev_publish }
    end
  end

  # GET /prev_publishes/1/edit
  def edit
    @prev_publish = PrevPublish.find(params[:id])
  end

  # POST /prev_publishes
  # POST /prev_publishes.xml
  def create
    @prev_publish = PrevPublish.new(params[:prev_publish])

    respond_to do |format|
      if @prev_publish.save
        format.html { redirect_to(@prev_publish, :notice => 'Prev publish was successfully created.') }
        format.xml  { render :xml => @prev_publish, :status => :created, :location => @prev_publish }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prev_publish.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prev_publishes/1
  # PUT /prev_publishes/1.xml
  def update
    @prev_publish = PrevPublish.find(params[:id])

    respond_to do |format|
      if @prev_publish.update_attributes(params[:prev_publish])
        format.html { redirect_to(@prev_publish, :notice => 'Prev publish was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prev_publish.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prev_publishes/1
  # DELETE /prev_publishes/1.xml
  def destroy
    @prev_publish = PrevPublish.find(params[:id])
    @prev_publish.destroy

    respond_to do |format|
      format.html { redirect_to(prev_publishes_url) }
      format.xml  { head :ok }
    end
  end
end
