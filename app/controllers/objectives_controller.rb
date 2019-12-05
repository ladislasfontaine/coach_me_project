class ObjectivesController < ApplicationController
	

	def show
		@user = User.find(params[:id])
		@objectives = Objective.all
		@objective = Objective.find(params[:id])
	end




end # end class