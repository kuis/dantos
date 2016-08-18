class FeedQuery
  attr_reader :posts

  def initialize posts:, page:
    @posts = posts.includes(:user, comments: :user).page(page).per(5)
  end
end