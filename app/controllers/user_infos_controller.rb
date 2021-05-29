class UserInfosController < ApplicationController
  def update
    UserInfoApi.new(current_user).user_infos
  end
end
