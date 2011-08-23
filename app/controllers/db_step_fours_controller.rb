class DbStepFoursController < ApplicationController
  # GET /db_step_fours
  # GET /db_step_fours.xml
  def index
    @db_step_fours = DbStepFour.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @db_step_fours }
    end
  end

  # GET /db_step_fours/1
  # GET /db_step_fours/1.xml
  def show
    @db_step_four = DbStepFour.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @db_step_four }
    end
  end

  # GET /db_step_fours/new
  # GET /db_step_fours/new.xml
  def new
    @db_step_four = DbStepFour.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @db_step_four }
    end
  end

  # GET /db_step_fours/1/edit
  def edit
    @db_step_four = DbStepFour.find(params[:id])
  end

  # POST /db_step_fours
  # POST /db_step_fours.xml
  def create
    @db_step_four = DbStepFour.new(params[:db_step_four])

    respond_to do |format|
      if @db_step_four.save
        format.html { redirect_to(DealBuilder.find(@db_step_four.deal_builder_id)) }
        format.xml  { render :xml => @db_step_four, :status => :created, :location => @db_step_four }
      else
        format.html { redirect_to new_db_step_four_path(:db_id => @db_step_four.deal_builder_id) }
        format.xml  { render :xml => @db_step_four.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /db_step_fours/1
  # PUT /db_step_fours/1.xml
  def update
    @db_step_four = DbStepFour.find(params[:id])

    respond_to do |format|
      if @db_step_four.update_attributes(params[:db_step_four])
        format.html { redirect_to(@db_step_four, :notice => 'Db step four was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @db_step_four.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /db_step_fours/1
  # DELETE /db_step_fours/1.xml
  def destroy
    @db_step_four = DbStepFour.find(params[:id])
    @db_step_four.destroy

    respond_to do |format|
      format.html { redirect_to(db_step_fours_url) }
      format.xml  { head :ok }
    end
  end
end