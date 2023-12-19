class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @genres = Genre.all
    if params[:genre_id].present?
      #presentメソッドでparams[:ge_id]に値が含まれているか確認 => trueの場合下記を実行
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items
    else
      @items = Item.order(created_at: :desc).limit(4)# 新着順に最初の4つを取得
    end
  end

  def about
  end
end
