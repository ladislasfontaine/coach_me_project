class UsersController < ApplicationController

  def welcome

  end

  def show
    @user = User.find(params[:id])
    @seances = Seance.all
  end


  def edit

  end
end
