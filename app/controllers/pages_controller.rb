class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i(home)

  def home
    if current_user
      #Antique.where(category_id: params[:category]).order("created_at DESC").paginate(page: params[:page], per_page: per_page)
      #Kata.where().paginate(:page => params[:page]).order('id DESC')
      #@katas = current_user.katas#.sort_by { |k| k.level_int.nil? ? -10 : k.level_int }.reverse
      @katas = current_user.katas.order(:level).reverse_order.paginate(page: params[:page], per_page: 50)#.sort_by { |k| k.level.nil? ? -10 : k.level }.reverse
      @katas = Kata.all.paginate(page: params[:page], per_page: 50)#.sort_by { |k| k.level.nil? ? -10 : k.level }.reverse
    end
  end

  def dashboard
  end
end
