class PagesController < ApplicationController
  def index
    if user_signed_in?
      @goomps = current_user.joined_goomps
      @posts = current_user.posts_from_joined_goomps.order(created_at: :desc)
      render "dashboard", layout: "application"
    else
      render "index"
    end
  end
end
