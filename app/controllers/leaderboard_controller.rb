class LeaderboardController < ApplicationController
  def leaderboard
    if params[:sort]
      if params[:sort] == "ranks"
        @users = User.order({overall_rank: :desc})
      elsif params[:sort] == "katas"
        @users = User.order({katas_completed_count: :desc})
      else
        @users = User.order({overall_rank: :desc})
      end
    else
      @users = User.order({overall_rank: :desc})
    end
  end
end
