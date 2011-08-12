class DbStepThreesController < ApplicationController
  # GET /db_step_threes
  # GET /db_step_threes.xml
  def index
    @db_step_threes = DbStepThree.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @db_step_threes }
    end
  end

  # GET /db_step_threes/1
  # GET /db_step_threes/1.xml
  def show
    @db_step_three = DbStepThree.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @db_step_three }
    end
  end

  # GET /db_step_threes/new
  # GET /db_step_threes/new.xml
  def new
    @db_step_three = DbStepThree.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @db_step_three }
    end
  end

  # GET /db_step_threes/1/edit
  def edit
    @db_step_three = DbStepThree.find(params[:id])
  end

  # POST /db_step_threes
  # POST /db_step_threes.xml
  def create
    @db_step_three = DbStepThree.new(params[:db_step_three])

    respond_to do |format|
      if @db_step_three.save
        format.html { redirect_to(new_deal_builder_path(:deal_builder_exist => DealBuilder.find(@db_step_three.deal_builder_id))) }
        format.xml  { render :xml => @db_step_three, :status => :created, :location => @db_step_three }
      else
        format.html { redirect_to(new_deal_builder_path(:deal_builder_exist => DealBuilder.find(@db_step_three.deal_builder_id))) }
        format.xml  { render :xml => @db_step_three.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /db_step_threes/1
  # PUT /db_step_threes/1.xml
  def update
    @db_step_three = DbStepThree.find(params[:id])

    respond_to do |format|
      if @db_step_three.update_attributes(params[:db_step_three])
        format.html { redirect_to(@db_step_three, :notice => 'Db step three was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @db_step_three.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /db_step_threes/1
  # DELETE /db_step_threes/1.xml
  def destroy
    @db_step_three = DbStepThree.find(params[:id])
    @db_step_three.destroy

    respond_to do |format|
      format.html { redirect_to(db_step_threes_url) }
      format.xml  { head :ok }
    end
  end
end
