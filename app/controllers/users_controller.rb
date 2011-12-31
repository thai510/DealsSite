class UsersController < ApplicationController
  skip_before_filter :authorize#, :except => [:create, :new,:check_email]
  before_filter :admin_authorize, :only => [:index,:new,:create]
  rescue_from ActiveRecord::RecordNotFound, :with => :edit_user_does_not_exist, :only => [:edit]

  # GET /users
  # GET /users.xml

  def index
    @users = User.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
   @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(home_path, :notice => "Your account" +
                       " was successfully created. Please Login.") }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => 'sign_up/index' }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  def check_email
    @user = User.find_by_email(params[:user][:email])

    respond_to do |format| 
      format.json {render :json => !@user}
    end
  end

  def edit_user_does_not_exist
    render :partial => 'layouts/wanderoff'
  end
end
