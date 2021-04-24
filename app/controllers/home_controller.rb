class HomeController < ApplicationController
    before_action :authenticate!

    def index
        @posts = Post.where(organization_id: Current.user.organization.id)
    end
end 