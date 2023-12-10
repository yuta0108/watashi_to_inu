class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
    if params[:genre_id].present?
      #presentメソッドでparams[:ge_id]に値が含まれているか確認 => trueの場合下記を実行
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items
    end
  end

  def show
  end
end
