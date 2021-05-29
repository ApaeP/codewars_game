class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i(home)

  def home
    if current_user

    end
  end

  def dashboard
  end
end
