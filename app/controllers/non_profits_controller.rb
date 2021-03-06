class NonProfitsController < ApplicationController
  # GET /non_profits
  # GET /non_profits.json
  before_filter :adminCheck, :except => :list
  def index
    @non_profits = NonProfit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @non_profits }
    end
  end

  # GET /non_profits/1
  # GET /non_profits/1.json
  def show
    @non_profit = NonProfit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @non_profit }
    end
  end

  # GET /non_profits/new
  # GET /non_profits/new.json
  def new
    @non_profit = NonProfit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @non_profit }
    end
  end

  # GET /non_profits/1/edit
  def edit
    @non_profit = NonProfit.find(params[:id])
  end

  # POST /non_profits
  # POST /non_profits.json
  def create
    @non_profit = NonProfit.new(params[:non_profit])

    respond_to do |format|
      if @non_profit.save
        format.html { redirect_to @non_profit, notice: 'Non profit was successfully created.' }
        format.json { render json: @non_profit, status: :created, location: @non_profit }
      else
        format.html { render action: "new" }
        format.json { render json: @non_profit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /non_profits/1
  # PUT /non_profits/1.json
  def update
    @non_profit = NonProfit.find(params[:id])

    respond_to do |format|
      if @non_profit.update_attributes(params[:non_profit])
        format.html { redirect_to @non_profit, notice: 'Non profit was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @non_profit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /non_profits/1
  # DELETE /non_profits/1.json
  def destroy
    @non_profit = NonProfit.find(params[:id])
    @non_profit.destroy

    respond_to do |format|
      format.html { redirect_to non_profits_url }
      format.json { head :ok }
    end
  end

  def list 
    @non_profits = NonProfit.all
  end
end
