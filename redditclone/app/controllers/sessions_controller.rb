class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_creds(
      params[:user][:username],
      params[:user][:password]
    )

    if @user.nil?
      flash[:errors] = ['well shit partner']
      @user = User.new
      render :new
    else
      log_in(@user)
      #redirect somewhere fun
      redirect_to subs_url
    end
  end

  def destroy
    log_out
    #redirectsomewhere else equally fun
    redirect_to new_session_url
  end
  
end
