class MicropostsController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy
  
  def create
    success_message = "Micropost created!"

	content = params[:micropost][:content]
    if Blog.is_blog_post? content
      current_user.blogs.create_with_post content
      success_message = "Blog created!"
    elsif Show.is_show_post? content
      new_show = Show.new_from_post content
      new_show.save
      success_message = "Show created!"
	elsif Track.is_track_upload_post? content
		@track = Track.new(params[:micropost][:track])
		success_message = "Track uploaded!"
		@track.session_name = Track.get_session_name(content)
		@track.name = Track.get_name(content, @track)
		@track.save
    end

	params[:micropost][:content] = params[:micropost][:content][0..136] + '...'
    @micropost = current_user.microposts.build(params[:micropost])
	

    if @micropost.save
      redirect_to home_path, :flash => { :success =>  success_message}
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_path, :flash => { :success => "Micropost deleted!" }
  end
  
  private
  
    def authorized_user
      @micropost = Micropost.find(params[:id])
      redirect_to root_path unless current_user?(@micropost.user)
    end
end