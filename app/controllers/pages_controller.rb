class PagesController < ApplicationController
  def index
    if user_signed_in?
      @room = current_user.rooms.first

      respond_to do |f|
        f.html { render "dashboard", layout: "application" }
        f.js { render "posts/infinite_posts" }
      end
    else
      render "index"
    end
  end
end
