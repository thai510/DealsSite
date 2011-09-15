class DbStepThreesController < ApplicationController
  before_filter :admin_authorize , :except => [:new,:edit,:create,:update,:show]
  helper_method :same_user?
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
        format.html { redirect_to(new_db_step_four_path(:db_id => @db_step_three.deal_builder_id)) }
        format.xml  { render :xml => @db_step_three, :status => :created, :location => @db_step_three }
      else
        format.html { render :action => :new ,:object => (@deal_builder_id = @db_step_three.deal_builder_id) }
        format.xml  { render :xml => @db_step_three.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /db_step_threes/1
  # PUT /db_step_threes/1.xml
  def update
    #this handles if no checkboxes are checked, and sends an emptry array,
    #which our model will catch and give an error message
    params[:db_step_three][:standard_restriction_ids] ||= []
    @db_step_three = DbStepThree.find(params[:id])

    respond_to do |format|
      if @db_step_three.update_attributes(params[:db_step_three])
        format.html { if DealBuilder.find(@db_step_three.deal_builder_id).db_step_four 
                         redirect_to(edit_db_step_four_path(DealBuilder.find(@db_step_three.deal_builder_id).db_step_four,
                                                           :db_id => @db_step_three.deal_builder_id))
                      else
                        redirect_to new_db_step_four_path(:db_id => @db_step_three.deal_builder_id)
                      end}
        format.xml  { head :ok }
      else
        format.html { render :action => :edit ,:object => (@deal_builder_id = @db_step_three.deal_builder_id) }
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

  def same_user?(deal_builder_id)
    unless DealBuilder.find(deal_builder_id).user_id == session[:users_id] || bool_admin_authorize
      redirect_to home_url
    end
  end
end
