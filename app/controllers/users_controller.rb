class UsersController < ApplicationController

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
    @user = User.find(params[:id])
    if ![:avatar].nil?
      @user.avatar.purge
      @user.avatar.attach(params[:avatar])
      redirect_to(user_path(@user))
    end # end if
  end

end
