class PaintsController < ApplicationController
    before_filter :signed_in_user,  only: [:create, :destroy]
    before_filter :correct_user,    only: :destroy
        
    def create 
        @paint = current_user.paints.build(params[:paint])
        if @paint.save 
            flash[:success] = "Paint Created!"
            redirect_to current_user
        else
            @inventory_items = []
            render 'static_pages/home'
        end
    end
    
    def destroy 
        @paint.destroy
        redirect_to current_user
    end
    
    private 
    
        def correct_user
            @paint = current_user.paints.find_by_id(params[:id])
            redirect_to current_user if @paint.nil?
        end
end