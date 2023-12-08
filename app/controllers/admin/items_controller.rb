class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all
  end

  def index
  end

  def show
  end

  def edit
  end
end
