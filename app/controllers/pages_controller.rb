class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i(home)

  def home
    if current_user
      @katas = current_user.katas#.sort_by { |k| k.level_int.nil? ? -10 : k.level_int }.reverse
    end
  end

  def dashboard
  end
end
