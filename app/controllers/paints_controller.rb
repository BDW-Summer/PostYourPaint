class PaintsController < ApplicationController
before_filter :signed_in_user, only: [:create, :edit, :destroy]
before_filter :correct_user,   only: [:edit, :destroy]

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
    @paint.destroy 
    redirect_to root_path
  end
  
  private 
    def correct_user
        @paint = current_user.paints.find_by_id(params[:id])
        redirect_to root_path if @paint.nil?
    end
  
end
