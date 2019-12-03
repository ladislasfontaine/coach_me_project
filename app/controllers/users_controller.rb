class UsersController < ApplicationController
	has_one_attached :avatar
  def welcome

  end



  def show
    @user = User.find(params[:id])
    @seances = Seance.all
  end


  def edit

  end
end
