class DbStepOnesController < ApplicationController
  # GET /db_step_ones
  # GET /db_step_ones.xml
  def index
    @db_step_ones = DbStepOne.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @db_step_ones }
    end
  end

  # GET /db_step_ones/1
  # GET /db_step_ones/1.xml
  def show
    @db_step_one = DbStepOne.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @db_step_one }
    end
  end

  # GET /db_step_ones/new
  # GET /db_step_ones/new.xml
  def new
    @db_step_one = DbStepOne.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @db_step_one }
    end
  end

  # GET /db_step_ones/1/edit
  def edit
    @db_step_one = DbStepOne.find(params[:id])
  end

  # POST /db_step_ones
  # POST /db_step_ones.xml
  def create
    @db_step_one = DbStepOne.new(params[:db_step_one])

    respond_to do |format|
      if @db_step_one.save
        format.html { @deal_builder_exist = DealBuilder.new;
                      @deal_builder_exist.user_id = current_user;
                      @deal_builder_exist.save; 
                      @db_step_one.deal_builder_id = @deal_builder_exist.id;
                      @db_step_one.save;
                      redirect_to( new_deal_builder_path(:deal_builder_exist => @deal_builder_exist) )}
        format.xml  { render :xml => @db_step_one, :status => :created, :location => @db_step_one }
      else
        format.html { render :action => "deal_builders/new" }
        format.xml  { render :xml => @db_step_one.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /db_step_ones/1
  # PUT /db_step_ones/1.xml
  def update
    @db_step_one = DbStepOne.find(params[:id])

    respond_to do |format|
      if @db_step_one.update_attributes(params[:db_step_one])
        format.html { redirect_to(@db_step_one, :notice => 'Db step one was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @db_step_one.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /db_step_ones/1
  # DELETE /db_step_ones/1.xml
  def destroy
    @db_step_one = DbStepOne.find(params[:id])
    @db_step_one.destroy

    respond_to do |format|
      format.html { redirect_to(db_step_ones_url) }
      format.xml  { head :ok }
    end
  end
end
