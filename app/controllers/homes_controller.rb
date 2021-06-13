class HomesController < ApplicationController


  def top
    @items = Item.page(params[:page]).reverse_order
  end

  def about
  end
end
