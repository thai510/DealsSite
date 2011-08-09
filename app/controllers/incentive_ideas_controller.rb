class IncentiveIdeasController < ApplicationController
  # GET /incentive_ideas
  # GET /incentive_ideas.xml
  def index
    @incentive_ideas = IncentiveIdea.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incentive_ideas }
    end
  end

  # GET /incentive_ideas/1
  # GET /incentive_ideas/1.xml
  def show
    @incentive_idea = IncentiveIdea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @incentive_idea }
    end
  end

  # GET /incentive_ideas/new
  # GET /incentive_ideas/new.xml
  def new
    @incentive_idea = IncentiveIdea.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @incentive_idea }
    end
  end

  # GET /incentive_ideas/1/edit
  def edit
    @incentive_idea = IncentiveIdea.find(params[:id])
  end

  # POST /incentive_ideas
  # POST /incentive_ideas.xml
  def create
    @incentive_idea = IncentiveIdea.new(params[:incentive_idea])

    respond_to do |format|
      if @incentive_idea.save
        format.html { redirect_to(@incentive_idea, :notice => 'Incentive idea was successfully created.') }
        format.xml  { render :xml => @incentive_idea, :status => :created, :location => @incentive_idea }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @incentive_idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /incentive_ideas/1
  # PUT /incentive_ideas/1.xml
  def update
    @incentive_idea = IncentiveIdea.find(params[:id])

    respond_to do |format|
      if @incentive_idea.update_attributes(params[:incentive_idea])
        format.html { redirect_to(@incentive_idea, :notice => 'Incentive idea was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @incentive_idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /incentive_ideas/1
  # DELETE /incentive_ideas/1.xml
  def destroy
    @incentive_idea = IncentiveIdea.find(params[:id])
    @incentive_idea.destroy

    respond_to do |format|
      format.html { redirect_to(incentive_ideas_url) }
      format.xml  { head :ok }
    end
  end
end
