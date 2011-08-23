class DbStepTwosController < ApplicationController
  # GET /db_step_twos
  # GET /db_step_twos.xml
  def index
    @db_step_twos = DbStepTwo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @db_step_twos }
    end
  end

  # GET /db_step_twos/1
  # GET /db_step_twos/1.xml
  def show
    @db_step_two = DbStepTwo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @db_step_two }
    end
  end

  # GET /db_step_twos/new
  # GET /db_step_twos/new.xml
  def new
    @db_step_two = DbStepTwo.new
      @db_step_two.locations.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @db_step_two }
    end
  end

  # GET /db_step_twos/1/edit
  def edit
    @db_step_two = DbStepTwo.find(params[:id])
  end

  # POST /db_step_twos
  # POST /db_step_twos.xml
  def create
    @db_step_two = DbStepTwo.new(params[:db_step_two])

    respond_to do |format|
      if @db_step_two.save
        format.html { redirect_to(new_db_step_three_path(:db_id => @db_step_two.deal_builder_id)) }
        format.xml  { render :xml => @db_step_two, :status => :created, :location => @db_step_two }
      else
        format.html { redirect_to(new_db_step_two_path(:db_id => @db_step_two.deal_builder_id)) }
        format.xml  { render :xml => @db_step_two.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /db_step_twos/1
  # PUT /db_step_twos/1.xml
  def update
    @db_step_two = DbStepTwo.find(params[:id])
    respond_to do |format|
      if @db_step_two.update_attributes(params[:db_step_two])
        format.html { redirect_to(edit_deal_builder_path(DealBuilder.find(@db_step_two.deal_builder_id))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @db_step_two.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /db_step_twos/1
  # DELETE /db_step_twos/1.xml
  def destroy
    @db_step_two = DbStepTwo.find(params[:id])
    @db_step_two.destroy

    respond_to do |format|
      format.html { redirect_to(db_step_twos_url) }
      format.xml  { head :ok }
    end
  end

end
