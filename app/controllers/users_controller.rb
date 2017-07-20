class UsersController < ApplicationController
  include ApplicationHelper
  before_action :authenticate

  def show
    @user = current_user
    @bookmarks = Bookmark.all.where(user: current_user)
    @likes = Bookmark.joins("INNER JOIN likes ON likes.bookmark_id = bookmarks.id AND likes.user_id = #{current_user.id}")
  end
end
