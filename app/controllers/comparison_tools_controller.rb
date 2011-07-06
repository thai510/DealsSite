class ComparisonToolsController < ApplicationController
  # GET /comparison_tools
  # GET /comparison_tools.xml
  def index
    @comparison_tools = ComparisonTool.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comparison_tools }
    end
  end

  # GET /comparison_tools/1
  # GET /comparison_tools/1.xml
  def show
    @comparison_tool = ComparisonTool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comparison_tool }
    end
  end

  # GET /comparison_tools/new
  # GET /comparison_tools/new.xml
  def new
    @comparison_tool = ComparisonTool.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comparison_tool }
    end
  end

  # GET /comparison_tools/1/edit
  def edit
    @comparison_tool = ComparisonTool.find(params[:id])
  end

  # POST /comparison_tools
  # POST /comparison_tools.xml
  def create
    @comparison_tool = ComparisonTool.new(params[:comparison_tool])

    respond_to do |format|
      if @comparison_tool.save
        format.html { redirect_to(@comparison_tool, :notice => 'Comparison tool was successfully created.') }
        format.xml  { render :xml => @comparison_tool, :status => :created, :location => @comparison_tool }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comparison_tool.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comparison_tools/1
  # PUT /comparison_tools/1.xml
  def update
    @comparison_tool = ComparisonTool.find(params[:id])

    respond_to do |format|
      if @comparison_tool.update_attributes(params[:comparison_tool])
        format.html { redirect_to(@comparison_tool, :notice => 'Comparison tool was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comparison_tool.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comparison_tools/1
  # DELETE /comparison_tools/1.xml
  def destroy
    @comparison_tool = ComparisonTool.find(params[:id])
    @comparison_tool.destroy

    respond_to do |format|
      format.html { redirect_to(comparison_tools_url) }
      format.xml  { head :ok }
    end
  end
end
