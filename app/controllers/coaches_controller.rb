class CoachesController < ApplicationController
  before_action :set_coach, only: %i[show edit update]
  before_action :is_owner?, only: %i[edit update]

  def index
    if (params[:city].nil? && params[:sport].nil?) || (params[:city] == "1" && params[:sport] == "1")
      @coaches = Coach.all
    elsif params[:city] == "1"
      @coaches = Coach.all.select{ |coach|
        if coach.specialties.nil?
          false
        else
          coach.specialties.map{ |specialty|
            if specialty.id == params[:sport].to_i
              true
            end 
          }.include?(true)
        end
      }
    elsif params[:sport] == "1"
      @coaches = Coach.all.select{ |coach|
        if !coach.city.nil?
          coach.city.id == params[:city].to_i 
        end 
      }
    else
      @coaches = Coach.all.select{ |coach|
        if !coach.city.nil?
          coach.city.id == params[:city].to_i 
        end
      }.select{ |coach|
        if coach.specialties.nil?
          false
        else
          coach.specialties.map{ |specialty|
            if specialty.id == params[:sport].to_i
              true
            end 
          }.include?(true)
        end
      }
    end
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

  def is_owner?
    if coach_signed_in? && current_coach.id == params[:id].to_i
      true
    else
      flash[:notice] = "Vous n'avez pas accès à cette page."
      redirect_to root_path
    end
  end
end
