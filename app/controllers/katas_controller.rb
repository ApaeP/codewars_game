class KatasController < ApplicationController

  def show
    @kata = Kata.find(params[:id])
  end

  def index
    @katas = Kata.all
    if params[:query]
      @katas = @katas.where('lower(title) LIKE :search OR lower(description) LIKE :search', search: "%#{params[:query].downcase}%")
    end
    if params[:filter] && params[:filter] != 'all'
      ids = current_user.katas.pluck(:id)
      if params[:filter] == 'completed'
        @katas = @katas.where(id: ids)
      elsif params[:filter] == 'not_completed'
        @katas = @katas.where.not(id: ids)
      end
    end
    @katas = @katas.valid.order(level: :desc).paginate(page: params[:page], per_page: 50)
  end

  def fetch_katas
    new_solutions = ApiFetcherWorker.perform_now(current_user)
    build_katas
    if current_user.codewars_password.nil? || current_user.codewars_email.nil?
      flash[:warning] = "You need to provide your codewars credits in order to retrieve your solutions"
      return
    end
    build_solutions(new_solutions)
    flash[:success] = "Vos données ont été mises à jour"
  end

  private

  def build_katas
    Kata.all.each do |e|
      next if e.url.present?

      KataBuilderWorker.perform_now(e)
    end
  end

  def build_solutions(new_solutions)
    manager = SolutionFetcher.new(current_user)
    manager.build_browser
    manager.authenticate
    new_solutions.each do |new_solution|
      manager.navigate_to_kata_solution(new_solution.kata)
      solutions_data = manager.read_solutions
      new_solution.update(content: solutions_data[new_solution.language])
    end
    manager.disconnect_user
  end
end
