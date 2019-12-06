class ObjectivesController < ApplicationController
	before_action :set_objective, only: %i[show destroy edit]	

	def show
		@user = User.find(params[:id])

	end

	def edit
		
	end

	def set_objective
		@objectives = Objective.all
		@objective = Objective.find(params[:id])
		
	end

end	