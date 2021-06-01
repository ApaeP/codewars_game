class FriendshipsController < ApplicationController
  def request_friendship
    @friendship = Friendship.new(requester_id: current_user.id, recipient_id: params[:user_id])
    if @friendship.save
      flash[:notice] = "Invitation sent to #{User.find(params[:user_id]).full_name}"
    else
      flash[:warning] = "You suck"
    end
  end

  def accept_friendship
    @friendship = Friendship.find(params[:id])
    if @friendship.update(status: "accepted")
      flash[:notice] = "Accepted invitation from #{User.find(params[:id]).full_name}"
    else
      flash[:warning] = "You suck"
    end
  end

  def reject_friendship
    @friendship = Friendship.find(params[:id])
    if @friendship.update(status: "refused")
      flash[:notice] = "Rejected invitation from #{User.find(params[:id]).full_name}"
    else
      flash[:warning] = "You suck"
    end
  end
end
