class PostsController < ApplicationController
    before_action :authenticate!

    def create
        post = Post.new body: post_params[:body]
        post.user = Current.user
        post.organization = Current.user.organization

        post.save
        flash[:notice] = "Post successfully created..."
        redirect_to root_path
    end

    private

    def post_params
        params.permit :body
    end
end