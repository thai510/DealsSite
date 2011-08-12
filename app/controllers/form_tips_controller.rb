class FormTipsController < ApplicationController
  # GET /form_tips
  # GET /form_tips.xml
  def index
    @form_tips = FormTip.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @form_tips }
    end
  end

  # GET /form_tips/1
  # GET /form_tips/1.xml
  def show
    @form_tip = FormTip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @form_tip }
    end
  end

  # GET /form_tips/new
  # GET /form_tips/new.xml
  def new
    @form_tip = FormTip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @form_tip }
    end
  end

  # GET /form_tips/1/edit
  def edit
    @form_tip = FormTip.find(params[:id])
  end

  # POST /form_tips
  # POST /form_tips.xml
  def create
    @form_tip = FormTip.new(params[:form_tip])

    respond_to do |format|
      if @form_tip.save
        format.html { redirect_to(@form_tip, :notice => 'Form tip was successfully created.') }
        format.xml  { render :xml => @form_tip, :status => :created, :location => @form_tip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @form_tip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /form_tips/1
  # PUT /form_tips/1.xml
  def update
    @form_tip = FormTip.find(params[:id])

    respond_to do |format|
      if @form_tip.update_attributes(params[:form_tip])
        format.html { redirect_to(@form_tip, :notice => 'Form tip was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @form_tip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /form_tips/1
  # DELETE /form_tips/1.xml
  def destroy
    @form_tip = FormTip.find(params[:id])
    @form_tip.destroy

    respond_to do |format|
      format.html { redirect_to(form_tips_url) }
      format.xml  { head :ok }
    end
  end
end
