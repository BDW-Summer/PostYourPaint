class StaticPagesController < ApplicationController
  def home
      if signed_in?
        @paint = current_user.paints.build
        @inventory_items = current_user.inventory.paginate(page: params[:page])
      end
  end

  def faq
  end
  
  def about
  end
  
  def terms 
  end
end
