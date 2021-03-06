class CommentsController < ApplicationController
	before_action :load_post, only:[:create]
	before_action :set_comment, only:[:show, :edit, :update, :destroy]
	
	def index
		@comments=Comment.all
	end

	def show
	end

	def new
		@comment = Comment.new
	end

	def create
    @comment = @post.comments.build(commment_params)
      if @comment.save
       redirect_to @post
      else
        render action: 'new'
      end
  end


	def edit
	end

	def update
		if @comment.update(commment_params)
			redirect to @comment
		else 
			render action: 'edit'
		end
	end

	def destroy
		@comment.destroy
		redirect_to posts_url
	end

	private

	def load_post
		@post = Post.find(params[:post_id])
	end

	def set_comment
		@comment = Comment.find(params[:id])
	end

	def commment_params
		params.require(:comment).permit(:post_id,:content,:author)
	end

end
