class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def index
		@featured_post = Post.last
		@recent_posts = Post.recent
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		post = Post.create(post_params)
		if post.valid?
			redirect_to post_path(post)
			flash[:success] = "Awesome. Your blog post just got saved!"
		else
			flash[:error] = "Sorry. We couldn't save you blog. Please re-submit"
			render "new"
		end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
			redirect_to post_path(@post)
			flash[:success] = "Awesome. Your blog post just got saved!"
		else
			flash[:error] = "Sorry. We couldn't save your blog post. Please re-submit"
			redirect_to edit_post_path(@post)
		end
	end

	def show
		@post = (Post.count > 0) ? Post.find(params[:id]) : nil
		if Post.count < 2
			@next_post = nil
		elsif (Post.last.id == @post.id)
			@next_post = @post.previous
		else
			@next_post = @post.next
		end
	end

	private

  def post_params
    params.require(:post).permit(:id,:title, :image_caption, :intro_section, :body, :image)
  end

end