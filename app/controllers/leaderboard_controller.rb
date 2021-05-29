class LeaderboardController < ApplicationController
  def leaderboard
    if params[:sort_by]
      @users = User.all
    else
      @users = User.all
    end
  end
end
