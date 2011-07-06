class MarketingPlansController < ApplicationController
  # GET /marketing_plans
  # GET /marketing_plans.xml
  def index
    @marketing_plans = MarketingPlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @marketing_plans }
    end
  end

  # GET /marketing_plans/1
  # GET /marketing_plans/1.xml
  def show
    @marketing_plan = MarketingPlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @marketing_plan }
    end
  end

  # GET /marketing_plans/new
  # GET /marketing_plans/new.xml
  def new
    @marketing_plan = MarketingPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @marketing_plan }
    end
  end

  # GET /marketing_plans/1/edit
  def edit
    @marketing_plan = MarketingPlan.find(params[:id])
  end

  # POST /marketing_plans
  # POST /marketing_plans.xml
  def create
    @marketing_plan = MarketingPlan.new(params[:marketing_plan])

    respond_to do |format|
      if @marketing_plan.save
        format.html { redirect_to(@marketing_plan, :notice => 'Marketing plan was successfully created.') }
        format.xml  { render :xml => @marketing_plan, :status => :created, :location => @marketing_plan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @marketing_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /marketing_plans/1
  # PUT /marketing_plans/1.xml
  def update
    @marketing_plan = MarketingPlan.find(params[:id])

    respond_to do |format|
      if @marketing_plan.update_attributes(params[:marketing_plan])
        format.html { redirect_to(@marketing_plan, :notice => 'Marketing plan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @marketing_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /marketing_plans/1
  # DELETE /marketing_plans/1.xml
  def destroy
    @marketing_plan = MarketingPlan.find(params[:id])
    @marketing_plan.destroy

    respond_to do |format|
      format.html { redirect_to(marketing_plans_url) }
      format.xml  { head :ok }
    end
  end
end
