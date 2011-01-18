class GeronimoController < ApplicationController

  def index
    blog = Blog.latest_for_frontpage
    @latest_front_page_blogpost = blog ? blog.blogtext : "Nothing to say"    
    @next_show = Show.next_show  
    render :layout => false
  end
  
  def shows
    @page_name = "Shows"
    @upcoming_shows = Show.upcoming_shows
    @past_shows = Show.past_shows
    render :layout => 'g_application'
  end
  
  def blogs
    @page_name = "Says Things"
    @blogs = Blog.order("created_at DESC")
    render :layout => 'g_application'    
  end
end