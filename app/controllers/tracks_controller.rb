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
	
	def frontpage
		track = Track.find(params[:id])
		frontpage_tracks = Track.where(:frontpage => true)
		frontpage_tracks.first.toggle!(:frontpage) unless frontpage_tracks.count == 0
		track.toggle!(:frontpage)	
		redirect_to :tracks
	end
end
