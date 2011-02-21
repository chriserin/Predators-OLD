class GeronimoController < ApplicationController

  def everything
    @page_name = "Everything"
    render 'example_site/everything', :layout => 'g_application'
  end


  def index
    blog = Blog.latest_for_frontpage
    @latest_front_page_blogpost = blog ? blog.blogtext : "Nothing to say"    
    @next_show = Show.next_show
	@frontpage_audio_url = Track.last.recording.url
    render 'example_site/index', :layout => false
  end
  
  def shows
    @page_name = "Shows"
    @upcoming_shows = Show.upcoming_shows
    @past_shows = Show.past_shows
    render 'example_site/shows', :layout => 'g_application'
  end
  
  def blogs
    @page_name = "Says Things"
    @blogs = Blog.order("created_at DESC")
    render 'example_site/blogs', :layout => 'g_application'    
  end
end