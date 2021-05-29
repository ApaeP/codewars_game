class KatasController < ApplicationController

  def show
    @kata = Kata.find(params[:id])
  end

  def index
    #Antique.where(category_id: params[:category]).order("created_at DESC").paginate(page: params[:page], per_page: per_page)
    #Kata.where().paginate(:page => params[:page]).order('id DESC')
    #@katas = current_user.katas#.sort_by { |k| k.level_int.nil? ? -10 : k.level_int }.reverse
    @katas = current_user.katas.order(:level).reverse_order.paginate(page: params[:page], per_page: 50)#.sort_by { |k| k.level.nil? ? -10 : k.level }.reverse
    @katas = Kata.all.paginate(page: params[:page], per_page: 50)#.sort_by { |k| k.level.nil? ? -10 : k.level }.reverse
  end

  def fetch_katas
    ApiFetcherWorker.perform_now(current_user)
    build_katas
    redirect_to root_path
  end

  private

  def build_katas
    flash[:notice] = "build katas"
    Kata.all.each do |e|
      next if e.title.present?

      KataBuilderWorker.perform_now(e)
    end
  end
end
