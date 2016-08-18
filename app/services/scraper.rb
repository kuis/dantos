class Scraper
  def self.scrape url
    doc = Nokogiri::HTML(open(url).read)
    title = doc.at_css("title").text.strip
    image_url = doc.at_css("img")&.attr("src")

    parsed_uri = Addressable::URI.parse(image_url)
    unless parsed_uri.host
      parsed_uri.path = '/' + parsed_uri.path

      parse_original_uri = Addressable::URI.parse(url)
      # parsed_uri.scheme = parse_original_uri.scheme
      parsed_uri.origin = parse_original_uri.origin
      image_url = parsed_uri.to_s
    end

    description_meta = doc.at_css("meta[name='description'], meta[name='og:description']")
    first_paragraph = doc.css("p").select { |p| p.text.length > 5 }.first
    description = if description_meta
      description_meta["content"]
    else
      first_paragraph
    end

    {
      title: title,
      description: description,
      image: image_url,
      url: url
    }
  end
end