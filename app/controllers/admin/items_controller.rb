class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  def create
    if @item = Item.find(params[:id])
      @item.save
      redirect_to admin_item_path
    else
      render 'new'
    end  
  end

  def index
  end

  def show
  end

  def edit
  end
  
  
end
