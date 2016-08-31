class Scraper
  def self.get_first_image doc
    image_url = doc.at_css("img")&.attr("src")

    parsed_uri = Addressable::URI.parse(image_url)
    unless parsed_uri.host
      parsed_uri.path = '/' + parsed_uri.path

      parse_original_uri = Addressable::URI.parse(url)
      # parsed_uri.scheme = parse_original_uri.scheme
      parsed_uri.origin = parse_original_uri.origin
      image_url = parsed_uri.to_s
    end

    image_url
  end

  def self.get_og_image doc
    doc.at_css("meta[property='og:image']")&.attr("content")
  end

  def self.get_description doc
    description_meta = doc.at_css("meta[name='description'], meta[property='og:description']")
    first_paragraph = doc.css("p").select { |p| p.text.length > 5 }.first
    description = if description_meta
      description_meta["content"]
    else
      first_paragraph
    end
  end

  def self.scrape url
    doc = Nokogiri::HTML(Typhoeus.get(url).body)
    title = doc.at_css("title").text.strip

    {
      title: title,
      description: get_description(doc),
      image: get_og_image(doc),
      url: url
    }
  end
end