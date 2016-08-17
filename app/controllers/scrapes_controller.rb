class ScrapesController < ApplicationController
  def create
    @link = Scraper.scrape(params[:url])
  end
end
