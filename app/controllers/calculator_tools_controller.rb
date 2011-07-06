class CalculatorToolsController < ApplicationController
  # GET /calculator_tools
  # GET /calculator_tools.xml
  def index
    @calculator_tools = CalculatorTool.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calculator_tools }
    end
  end

  # GET /calculator_tools/1
  # GET /calculator_tools/1.xml
  def show
    @calculator_tool = CalculatorTool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @calculator_tool }
    end
  end

  # GET /calculator_tools/new
  # GET /calculator_tools/new.xml
  def new
    @calculator_tool = CalculatorTool.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calculator_tool }
    end
  end

  # GET /calculator_tools/1/edit
  def edit
    @calculator_tool = CalculatorTool.find(params[:id])
  end

  # POST /calculator_tools
  # POST /calculator_tools.xml
  def create
    @calculator_tool = CalculatorTool.new(params[:calculator_tool])

    respond_to do |format|
      if @calculator_tool.save
        format.html { redirect_to(@calculator_tool, :notice => 'Calculator tool was successfully created.') }
        format.xml  { render :xml => @calculator_tool, :status => :created, :location => @calculator_tool }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @calculator_tool.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calculator_tools/1
  # PUT /calculator_tools/1.xml
  def update
    @calculator_tool = CalculatorTool.find(params[:id])

    respond_to do |format|
      if @calculator_tool.update_attributes(params[:calculator_tool])
        format.html { redirect_to(@calculator_tool, :notice => 'Calculator tool was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calculator_tool.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calculator_tools/1
  # DELETE /calculator_tools/1.xml
  def destroy
    @calculator_tool = CalculatorTool.find(params[:id])
    @calculator_tool.destroy

    respond_to do |format|
      format.html { redirect_to(calculator_tools_url) }
      format.xml  { head :ok }
    end
  end
end
