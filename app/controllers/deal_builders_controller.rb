class DealBuildersController < ApplicationController
  before_filter :finished_step_zero?
  rescue_from ActiveRecord::RecordNotFound, :with => :deal_does_not_exist

  # GET /deal_builders
  # GET /deal_builders.xml
  def index
    @deal_builders = DealBuilder.all
    @prev_publishes = current_user.prev_publishes.paginate :page => params[:page], :per_page => 14, :order => 'created_at desc' 

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
        format.html { 
                         redirect_to new_db_step_two_path(@deal_builder)
                      }
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
        format.html { unless submitted(@deal_builder)
                       unless @deal_builder.db_step_two 
                         redirect_to new_db_step_two_path(@deal_builder)
                       else
                       render :template => "new", :object => @deal_builder
                       end
                      else
                       redirect_to(@deal_builder)
                      end}
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

  def deal_does_not_exist
    render :partial => 'layouts/wanderoff'
  end

end
