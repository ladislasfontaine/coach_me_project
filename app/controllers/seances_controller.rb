# frozen_string_literal: true

class SeancesController < ApplicationController
  before_action :set_seance, only: %i[show destroy]
  before_action :is_participant?, only: %i[show destroy]

  def create
    @coach = Coach.find(params[:coach_id])
    @seance = Seance.new(coach: @coach, user: current_user, start_date: params[:start_date], duration: params[:duration], place: params[:place])
    if is_overlapping?(params[:start_date], params[:duration])
      flash[:notice] = 'Une séance est déjà réservée sur ce créneau.'
      return redirect_to coach_path(params[:coach_id])
      # Amount in cents

      @amount = (@coach.price * 100).to_i

      customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'eur'
      )
    elsif @seance.save
      flash[:notice] = "La séance est créée. Merci d'avoir réservé avec CoachMe."
      redirect_to seance_path(Seance.last.id)
    else
      flash[:notice] = 'Un problème est survenu.'
      return redirect_to coach_path(params[:coach_id])
    end
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to coach_path(params[:coach_id])
  end

  def show
    @coach = @seance.coach
    @user = @seance.user
    @price = ((@seance.duration / 60).to_f * @coach.price)
  end

  def destroy
    flash[:notice] = if @seance.destroy
                       'La séance est supprimée.'
                     else
                       "Un problème est survenu. La séance n'est pas supprimée."
                     end
    # then redirect to coach_path(current_coach.id)
    redirect_to coaches_path
  end

  private

  def set_seance
    @seance = Seance.find(params[:id])
  end

  def is_overlapping?(start, duration)
    time_array = start.split(/[-, T, :]/)
    seance_start = Time.new(time_array[0], time_array[1], time_array[2], time_array[3], time_array[4]).strftime('%s').to_i
    seance_end = seance_start + (duration.to_i * 60)

    @coach = Coach.find(params[:coach_id])
    @seances = @coach.seances
    @seances.each do |seance|
      instance_start = seance.start_date.strftime('%s').to_i
      instance_end = instance_start + (duration.to_i * 60)
      if (seance_start..seance_end).overlaps?(instance_start..instance_end)
        return true
        break
      end
    end
    false
  end

  def is_participant?
    if (coach_signed_in? && Seance.find(params[:id]).coach == current_coach) || (user_signed_in? && Seance.find(params[:id]).user == current_user)
      true
    else
      flash[:notice] = "Vous n'avez pas accès à cette page."
      redirect_to root_path
    end
  end
end
