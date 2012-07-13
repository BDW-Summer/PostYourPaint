class PaintsController < ApplicationController
before_filter :signed_in_user, only: [:create, :edit, :destroy]

  def new
    @paint = Paint.new
  end
  
  def show
    @paint = Paint.find(params[:user_id])
  end
  
  def create 
    @paint = current_user.paints.build(params[:paint])
    if @paint.save 
        flash[:success] = "Paint created!"
        redirect_to current_user
    else
        @inventory_items = []    
        render current_user
    end
  end
  
  def edit
  end
  
  def destroy 
  end
  
end
