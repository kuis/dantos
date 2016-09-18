class Post < ApplicationRecord
  belongs_to :goomp, touch: true, counter_cache: true
  belongs_to :user, touch: true
  belongs_to :subtopic, optional: true, touch: true
  has_many :comments, dependent: :destroy
  has_one :message, dependent: :destroy
  
  include Likable

  def generate_link_for_story!
    doc = Nokogiri::HTML(self.content)
    doc.css('.medium-insert-buttons').remove
    self.update(
      content: doc,
      link_description: Nokogiri::HTML(self.content).at_css("p").text,
      link_url: Rails.application.routes.url_helpers.post_path(self),
      link_title: self.title
    )
  end
end
