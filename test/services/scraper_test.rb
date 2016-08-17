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
end
