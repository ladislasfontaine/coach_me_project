class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  def welcome

  end

  def show
    @seances = Seance.all
    @objectives = Objective.all
  end


  def edit
    @cities = City.all
    @objectives = Objective.all
    @data = Datum.all

  end


  def update
    @city = City.find(params[:city])
    @objective = Objective.find(params[:objective])

    if !params[:avatar].nil?
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

  private

  def set_user
    @user = User.find(params[:id])
  end
end
