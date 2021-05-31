class UserInfosController < ApplicationController
  def update
    @user = User.find(params[:user_id])
    if @user.fetch_and_update_infos
      flash[:notice] = "Profile updated"
    else
      flash[:alert] = "Profile update failed"
    end
  end

  def lol
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nlol\n\n#{params}\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  end


  def dashboard
    @katas = current_user.katas.paginate(page: params[:page], per_page: 5)
  end
end
