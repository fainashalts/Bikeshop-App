class MotorcyclesController < ApplicationController
	
	def index
		@motorcycles = Motorcycle.all
	end

	def show
		@motorcycle = Motorcycle.find(params[:id])
	end

	def new
		@motorcycle = Motorcycle.new
	end

	def create
		@motorcycle = Motorcycle.new (motorcycle_params)

		if @motorcycle.save
			redirect_to motorcycles_path
		else
			render :new
		end
	end

	def destroy
		@motorcycle = Motorcycle.find(params[:id])
		@motorcycle.destroy
		redirect_to motorcycles_path
	end

	def edit
		@motorcycle = Motorcycle.find(params[:id])
	end

	def update

		@motorcycle = Motorcycle.find(params[:id])

		if @motorcycle.update_attributes(motorcycle_params)
			redirect_to motorcycles_path
		else 
			render "edit"
		end
	end
	
	private

	def motorcycle_params
		params.require(:motorcycle).permit(:name, :brand, :speed)
	end
end