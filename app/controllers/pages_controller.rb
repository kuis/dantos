class PagesController < ApplicationController
  def index
    if user_signed_in?
      if current_user.rooms.first
        redirect_to current_user.rooms.last
      else
        render "dashboard", layout: "application"
      end
    else
      render "index"
    end
  end
end
