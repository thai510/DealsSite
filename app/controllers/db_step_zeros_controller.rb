class DbStepZerosController < ApplicationController
  # GET /db_step_zeros
  # GET /db_step_zeros.xml
  def index
    @db_step_zeros = DbStepZero.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @db_step_zeros }
    end
  end

  # GET /db_step_zeros/1
  # GET /db_step_zeros/1.xml
  def show
    @db_step_zero = DbStepZero.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @db_step_zero }
    end
  end

  # GET /db_step_zeros/new
  # GET /db_step_zeros/new.xml
  def new
    @db_step_zero = DbStepZero.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @db_step_zero }
    end
  end

  # GET /db_step_zeros/1/edit
  def edit
    @db_step_zero = DbStepZero.find(params[:id])
  end

  # POST /db_step_zeros
  # POST /db_step_zeros.xml
  def create
    @db_step_zero = DbStepZero.new(params[:db_step_zero])

    respond_to do |format|
      if @db_step_zero.save
        format.html { redirect_to(home_path, :notice => 'Db step zero was successfully created.') }
        format.xml  { render :xml => @db_step_zero, :status => :created, :location => @db_step_zero }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @db_step_zero.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /db_step_zeros/1
  # PUT /db_step_zeros/1.xml
  def update
    @db_step_zero = DbStepZero.find(params[:id])

    respond_to do |format|
      if @db_step_zero.update_attributes(params[:db_step_zero])
        format.html { redirect_to(edit_user_path(session[:users_id]), :notice => 'Db step zero was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @db_step_zero.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /db_step_zeros/1
  # DELETE /db_step_zeros/1.xml
  def destroy
    @db_step_zero = DbStepZero.find(params[:id])
    @db_step_zero.destroy

    respond_to do |format|
      format.html { redirect_to(db_step_zeros_url) }
      format.xml  { head :ok }
    end
  end
end
