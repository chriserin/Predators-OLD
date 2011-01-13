class GeronimoController < ApplicationController

  def index
    @latest_front_page_blogpost = Blog.latest_for_frontpage.blogtext
	render :layout => false
  end
end