class CoachesController < ApplicationController

  def index
    @coaches = Coach.all
  end

  def show
    @coach = Coach.find(params[:id])
  end

  def dashboard
    @coach = Coach.find(params[:id])
  end

end
