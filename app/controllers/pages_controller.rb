class PagesController < ApplicationController
  def index
    if user_signed_in?
      @goomps = current_user.joined_goomps
      @posts = FeedQuery.new(posts: current_user.posts_from_joined_goomps, page: params[:page]).posts

      respond_to do |f|
        f.html { render "dashboard", layout: "application" }
        f.js { render "posts/infinite_posts" }
      end
    else
      render "index"
    end
  end
end
