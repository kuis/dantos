class PagesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to current_user.rooms.first
      # @messages = @room&.messages&.includes(:user) || []

      # respond_to do |f|
      #   f.html { render "dashboard", layout: "application" }
      #   f.js { render "posts/infinite_posts" }
      # end
    else
      render "index"
    end
  end
end
