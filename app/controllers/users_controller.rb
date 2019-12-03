class UsersController < ApplicationController
	
  def welcome

  end



  def show
    @user = User.find(params[:id])
    @seances = Seance.all
  end


  def edit

  end

  def update
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    redirect_to(user_path(@user))
  end

end
