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
end
