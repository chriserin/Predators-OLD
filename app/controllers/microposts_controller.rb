class MicropostsController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy
  
  def create
    success_message = "Micropost created!"
    @micropost = current_user.microposts.build(params[:micropost])
	if(Blog.is_blog_post? params[:micropost][:content])
		current_user.blogs.create_with_post params[:micropost][:content]
		success_message = "Blog created!"
	end
	
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