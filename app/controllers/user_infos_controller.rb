class UserInfosController < ApplicationController
  def update
    @user = User.find(params[:user_id])
    if @user.fetch_and_update_infos
      flash[:notice] = "Profile updated"
    else
      flash[:alert] = "Profile update failed"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def dashboard
    @katas = current_user.katas.paginate(page: params[:page], per_page: 6)
  end
end
