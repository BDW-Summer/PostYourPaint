class PaintsController < ApplicationController
    before_filter :signed_in_user,  only: [:new, :create, :destroy]
    before_filter :correct_user,    only: :destroy
    before_filter :prepare_color_families
   
   def by_family
    family = ColorFamily.find_by_family(params[:paint_family])
    @paints = Paint.find_all_by_family_id(family.id)
    
   end
   
   
   def show
        @family = ColorFamily.find_by_family(params[:family])
            Paint.find_by_family_id(@family.id)
            
        # or it could be
        #@paint = Paint.find_by_family_id(@family.id)   
   end
        
   def new 
    @paint = Paint.new
   end     
        
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
    
        def prepare_color_families
            @color_families = ColorFamily.all
        end
    
        def correct_user
            @paint = current_user.paints.find_by_id(params[:id])
            redirect_to current_user if @paint.nil?
        end
end