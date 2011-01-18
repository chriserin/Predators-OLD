class ShowsController < ApplicationController
	
	def show
		@show = Show.find(params[:id])	
	end

	def destroy
		redirect_to root_path unless signed_in?
		@show = Show.find(params[:id])
		@show.destroy
		redirect_to all_shows_path, :flash => { :success => "Micropost deleted!" }
	end
end
