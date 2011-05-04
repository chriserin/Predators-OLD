class GeronimoController < ApplicationController

  def everything
    @page_name = "Everything"
    render 'example_site/everything', :layout => 'g_application'
  end

  def index
    blog = Blog.latest_for_frontpage
    @latest_front_page_blogpost = blog ? blog.to_html : "Predators hunt you"    
    @next_show = Show.next_show
	if(Track.where(:frontpage => true).count > 0)
		@frontpage_audio_url = Track.where(:frontpage => true).first.recording.url
		@tracks = Track.where(:frontpage => true).limit(4);
	end
	@pictures = Picture.all.shuffle
    render 'predators/home', :layout => 'simple'
  end
  
  def shows
    @page_name = "Shows"
    @upcoming_shows = Show.upcoming_shows
    @past_shows = Show.past_shows
    render 'predators/shows', :layout => 'g_application'
  end
  
  def blogs
    @page_name = "Says Things"
    @blogs = Blog.order("created_at DESC")
    render 'example_site/blogs', :layout => 'g_application'    
  end
end