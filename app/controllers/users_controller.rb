class UsersController < ApplicationController

  def welcome

  end

  def show
    @user = User.find(params[:id])
    @seances = Seance.all
  end


  def edit
    @user = User.find(params[:id])
    @cities = City.all
    @objectives = Objective.all
  end


  def update

    @user = User.find(params[:id])
    @city = City.find(params[:city])
    @objective = Objective.find(params[:objective])

    if ![:avatar].nil?
      @user.avatar.purge
      @user.avatar.attach(params[:avatar])
    end
    if  @user.update(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        birth_date: params[:birth_date],
        phone_number: params[:phone_number],
        address: params[:address],
        city: @city,
        zip_code: params[:zip_code],
        description: params[:description],
        objective: @objective
      )
      flash[:notice] = "Ton profil utilisateur a bien été modifié."
      redirect_to(user_path(@user))
    else
      flash[:alert] = "Ton profil utilisateur n'a pas pu être modifié."
      redirect_to edit_user_path(@user)
    end

  end

end
