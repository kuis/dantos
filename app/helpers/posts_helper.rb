module PostsHelper
  def truncate_body_link text
    auto_link(text, html: { target: '_blank', rel: "nofollow" }) do |text|
      truncate(text, length: 50)
    end
  end
end
