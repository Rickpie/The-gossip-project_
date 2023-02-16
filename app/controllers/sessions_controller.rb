class SessionsController < ApplicationController
    include SessionsHelper
  
    # GET /login
    def new
      @user = User.new
    end
  
    # POST /login - Authenticate account
    def create
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
        flash[:success] = "You are logged succesfully!"
  
        # Login and set to session
        log_in(@user)
  
        # Login and set to cookies
        params[:remember_me] ? remember(@user) : forget(@user)
      
  
        redirect_back_or gossips_path
      else
        flash[:error] = 'Invalid email/password combination'
        render :new
      end
    end
  
    # DELETE /logout
    def destroy
      log_out
      redirect_to root_url
    end
  end