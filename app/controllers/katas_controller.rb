class KatasController < ApplicationController

  def fetch_katas
    data = ApiManager.new(api_token: current_user.codewars_api_token, nickname: current_user.codewars_nickname).fetch_all
    count = data.count
    flash[:notice] = "katas fetched #{count}"
    data.each do |xdata|
      p xdata
      Kata.create(
                  codewars_id: xdata["id"],
                  user: current_user,
                  language: xdata["completedLanguages"].first,
                  title: xdata["name"]
                  )
    end
    redirect_to root_path
  end

  def build_kata
    @kata = Kata.find(params[:id])
    flash[:notice] = "build kata #{@kata.title}"

    redirect_to root_path
  end

  def build_katas
    flash[:notice] = "build katas"

    redirect_to root_path
  end
end
