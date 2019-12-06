class ObjectivesController < ApplicationController
	before_action :set_objective, only: %i[show destroy edit]	

	def show
		@user = User.find(params[:id])

	end

	def edit
		
	end

	def update
		@objective = Objective.find(params[:objective])
		if @objective.update(
				description: @objective
				)
			flash[:notice] = "Ton objective a bien été modifié."
	      	redirect_to objective_path(params[:id])
	   	else
	      	flash[:alert] = "Desole mais on a pas pu modifier :("
	      redirect_to edit_objective_path(params[:id])
	    end	
			
			
	end


	def set_objective
		@objectives = Objective.all
		@objective = Objective.find(params[:id])

	end

end	