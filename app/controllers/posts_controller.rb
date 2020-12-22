class PostsController < ApplicationController
    def index 
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create 
        @post = Post.create(post_params)
        if @post.valid?
            @post.likes = 0
            @post.save
            redirect_to @post
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end

end