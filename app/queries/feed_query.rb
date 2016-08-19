class FeedQuery
  attr_reader :posts

  def initialize posts:, page:
    @posts = posts.includes(:goomp, :user, comments: :user).order(created_at: :desc).page(page).per(5)
  end
end