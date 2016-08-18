require 'test_helper'

class ScraperTest < ActiveSupport::TestCase
  test "#scrape #1" do
    url = "https://medium.com/@Stephanbv/elixir-phoenix-lets-code-authentication-todo-application-part-1-599ee94cd04d#.59a9pm1jc"
    json = {}
    VCR.use_cassette("scraper-url-1") do
      json = Scraper.scrape(url)
    end
    assert_equal("Elixir /Phoenix— Lets code authentication. Todo application part 1. — Medium", json[:title])
  end

  test "#scrape #2" do
    url = "http://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations"
    json = {}
    VCR.use_cassette("scraper-url-2") do
      json = Scraper.scrape(url)
    end
    assert_equal("Active Record Query Interface — Ruby on Rails Guides", json[:title])
    assert_equal("http://guides.rubyonrails.org/images/chapters_icon.gif", json[:image])
  end
end
