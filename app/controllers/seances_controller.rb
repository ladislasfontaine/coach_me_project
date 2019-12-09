class SeancesController < ApplicationController
  before_action :set_seance, only: %i[show destroy]

  def create
     @coach = Coach.find(params[:coach_id])
    
    # Amount in cents
      
    @amount = (@coach.price * 100).to_i

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })

    charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'eur',
      })

    @seance = Seance.new(coach: @coach, user: current_user, start_date: params[:start_date], duration: params[:duration], place: params[:place])
    if @seance.save
      flash[:notice] = "La séance est créée. Merci d'avoir réservé avec CoachMe."
    else
      flash[:notice] = "Un problème est survenu."
    end
    redirect_to seance_path(Seance.last.id)
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to seance_path(params[:id])
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
