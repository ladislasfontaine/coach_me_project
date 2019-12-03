class UsersController < ApplicationController
<<<<<<< HEAD
	
=======

>>>>>>> 1364cd57282b97d0dc457502ff21f78798631337
  def welcome

  end



  def show
    @user = User.find(params[:id])
    @seances = Seance.all
  end


  def edit
    @user = User.find(params[:id])

  end


  def updated


  end

  def update
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    redirect_to(user_path(@user))
  end

end
