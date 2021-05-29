class KatasController < ApplicationController

  def show
    @kata = Kata.find(params[:id])
  end

  def index
    if params[:query]
      @katas = Kata.where(id: 20).paginate(page: params[:page], per_page: 50)
    else
      @katas = Kata.valid.order({level: :desc}).paginate(page: params[:page], per_page: 50)
    end
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
