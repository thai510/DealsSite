class DbStepFoursController < ApplicationController
  before_filter :admin_authorize , :except => [:new,:edit,:create,:update,:show]
  helper_method :same_user?
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
        format.html { render :action => :new ,:object => (@deal_builder_id = @db_step_four.deal_builder_id) }
        format.xml  { render :xml => @db_step_four.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /db_step_fours/1
  # PUT /db_step_fours/1.xml
  def update
    #accounts for no incentive ideas being checked
    #sends empty array in that case
    params[:db_step_four][:incentive_idea_ids] ||= []
    @db_step_four = DbStepFour.find(params[:id])

    respond_to do |format|
      if @db_step_four.update_attributes(params[:db_step_four])
        format.html { redirect_to(edit_deal_builder_path(DealBuilder.find(@db_step_four.deal_builder_id))) }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit ,:object => (@deal_builder_id = @db_step_four.deal_builder_id) }
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

  def same_user?(deal_builder_id)
    unless DealBuilder.find(deal_builder_id).user_id == session[:users_id] || bool_admin_authorize
      redirect_to home_url
    end
  end
end
