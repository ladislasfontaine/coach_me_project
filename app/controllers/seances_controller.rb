class SeancesController < ApplicationController
  before_action :set_seance, only: %i[show destroy]

  def create
    @coach = Coach.find(params[:coach_id])
    @seance = Seance.new(coach: @coach, user: current_user, start_date: params[:start_date], duration: params[:duration], place: params[:place])
    if @seance.save
      flash[:notice] = "La séance est créée. Merci d'avoir réservé avec CoachMe."
    else
      flash[:notice] = "Un problème est survenu."
    end
    redirect_to coach_path(@coach.id)
  end

  def show
    @coach = @seance.coach
    @user = @seance.user
    @price = ((@seance.duration / 60).to_f * @coach.price)
  end

  def destroy
    if @seance.destroy
      flash[:notice] = "La séance est supprimée."
    else
      flash[:notice] = "Un problème est survenu. La séance n'est pas supprimée."
    end
    # then redirect to coach_path(current_coach.id)
    redirect_to coaches_path
  end

  private

  def set_seance
    @seance = Seance.find(params[:id])
  end
end
