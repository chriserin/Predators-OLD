class BlogsController < ApplicationController

	def destroy
		redirect_to root_path unless signed_in?
		@blog = Blog.find(params[:id])
		@blog.destroy
		redirect_to blogs_path, :flash => { :success => "Blog deleted!" }
	end
end
