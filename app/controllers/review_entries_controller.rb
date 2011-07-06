class ReviewEntriesController < ApplicationController
  # GET /review_entries
  # GET /review_entries.xml
  def index
    @review_entries = ReviewEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @review_entries }
    end
  end

  # GET /review_entries/1
  # GET /review_entries/1.xml
  def show
    @review_entry = ReviewEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @review_entry }
    end
  end

  # GET /review_entries/new
  # GET /review_entries/new.xml
  def new
    @review_entry = ReviewEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @review_entry }
    end
  end

  # GET /review_entries/1/edit
  def edit
    @review_entry = ReviewEntry.find(params[:id])
  end

  # POST /review_entries
  # POST /review_entries.xml
  def create
    @review_entry = ReviewEntry.new(params[:review_entry])

    respond_to do |format|
      if @review_entry.save
        format.html { redirect_to(@review_entry, :notice => 'Review entry was successfully created.') }
        format.xml  { render :xml => @review_entry, :status => :created, :location => @review_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @review_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /review_entries/1
  # PUT /review_entries/1.xml
  def update
    @review_entry = ReviewEntry.find(params[:id])

    respond_to do |format|
      if @review_entry.update_attributes(params[:review_entry])
        format.html { redirect_to(@review_entry, :notice => 'Review entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @review_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /review_entries/1
  # DELETE /review_entries/1.xml
  def destroy
    @review_entry = ReviewEntry.find(params[:id])
    @review_entry.destroy

    respond_to do |format|
      format.html { redirect_to(review_entries_url) }
      format.xml  { head :ok }
    end
  end
end
