class InfinitePostsQuery
  def initialize posts
    posts.includes(:user, comments: :user).page(params[:page]).per(5)
  end
end