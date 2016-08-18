class PagesController < ApplicationController
  def index
    if user_signed_in?
      @goomps = current_user.joined_goomps
      @posts = InfinitePostsQuery.new(current_user.posts_from_joined_goomps)

      respond_to do |f|
        f.html { render "dashboard", layout: "application" }
        f.js { render "posts/infinite_posts" }
      end
    else
      render "index"
    end
  end
end
