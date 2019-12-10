class CoachesController < ApplicationController
  before_action :set_coach, only: %i[show edit update]

  def index
    @coaches = Coach.all
  end

  def coach_params
    #params.require(:coach).permit(:first_name)
  end

  def show
    @seances = @coach.seances
  end

  def edit
    @cities = City.all
  end

  def update
    @city = City.find(params[:city])
    # check for images and attach them
    if !params[:avatar].nil?
      @coach.avatar.purge
      @coach.avatar.attach(params[:avatar])
    end
    if !params[:cover].nil?
      @coach.cover.purge
      @coach.cover.attach(params[:cover])
    end
    if !params[:diploma].nil?
      @coach.diploma.purge
      @coach.diploma.attach(params[:diploma])
    end
    # check for updates
    if @coach.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      address: params[:address],
      zip_code: params[:zip_code],
      city: @city,
      price: params[:price],
      siret: params[:siret],
      account_name: params[:account_name],
      account_number: params[:account_number]
    )
      flash[:notice] = "Ton profil coach a bien été modifié."
      redirect_to coach_path(params[:id])
    else
      flash[:alert] = "Ton profil coach n'a pas pu être modifié."
      redirect_to edit_coach_path(params[:id])
    end
  end

  private

  def set_coach
    @coach = Coach.find(params[:id])
  end

end
