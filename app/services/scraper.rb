class Scraper
  def self.scrape url
    doc = Nokogiri::HTML(open(url).read)
    title = doc.at_css("title").text.strip
    image = doc.at_css("img")&.attr("src")

    description_meta = doc.at_css("meta[name='description'], meta[name='og:description']")
    first_paragraph = doc.css("p").select { |p| p.text.length > 5 }.first
    description = description_meta["content"] || description_meta["content"] || first_paragraph

    {
      title: title,
      description: description,
      image: image,
      url: url
    }
  end
end