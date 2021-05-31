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
    new_solutions = ApiFetcherWorker.perform_now(current_user)
    build_katas
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


# fetch_katas
  # 1 - On recupère les informations d'un user via l'api (ApiFetcherWorker)
              # qui fetch un hash de katas complétés
              # qui crée un empty Kata pour chaque nouveau kata trouvé
              # qui crée une solution pour chaque language de chaque kata trouvé
            # return an array of new Solutions

  # 2 - Pour chaque nouveau kata
  #         on met en queue prio n°1 la récupération des données du kata via l'api (KataBuilderWorker)

  # 2 - Pour chaque nouvelle solution
  #         on met en queue prio n°2 la récupération de la solution en ligne (FetchSolutionsWorker)
