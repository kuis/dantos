json.extract! @link, :title, :url, :image, :description
json.card render(
  partial: "posts/post_card",
  locals: @link,
  formats: [:html]
)