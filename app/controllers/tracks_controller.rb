class TracksController < ApplicationController

	def index
		@tracks = Track.order(:session_name)
		@tracks_grouped_by_session = {}
		@tracks.each do |track|
			@tracks_grouped_by_session[track.session_name] = [] if @tracks_grouped_by_session[track.session_name].nil?
			@tracks_grouped_by_session[track.session_name] << track
		end
		
		render :index, :layout => 'g_application'
	end
end
