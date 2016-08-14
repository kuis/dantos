class PagesController < ApplicationController
  def index
    if user_signed_in?
      @goomps = Goomp.all
      @posts = Post.all
      render "dashboard", layout: "application"
    else
      render "index"
    end
  end
end
