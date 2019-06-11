class SubsController < ApplicationController
  before_action :require_logged_in

  def new
    @sub = Sub.new 
    render :new   
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.mod_id = current_user.id    
    if @sub.save
      #redirect
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new 
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = current_user.modded_subs.find(params[:id])

    if @sub.update_attributes(sub_params)
      #redirect to SOMETHING GOOD HE SAYS
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit 
    end
  end

  private 

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
