class PicturesController < ApplicationController

	def index
		@pictures = Picture.all.shuffle
		
		render :index, :layout => 'g_application'
	end
	
end