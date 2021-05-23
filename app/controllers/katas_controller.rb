class KatasController < ApplicationController

  def fetch_katas
    ApiFetcherWorker.perform_now current_user
    redirect_to root_path
  end

  def build_kata
    @kata = Kata.find(params[:id])
    KataBuilderWorker.perform_now(@kata)
    flash[:notice] = "build kata #{@kata.title}"

    redirect_to root_path
  end

  def build_katas
    flash[:notice] = "build katas"

    redirect_to root_path
  end
end
