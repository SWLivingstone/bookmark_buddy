class UsersController < ApplicationController
  include ApplicationHelper
  before_action :authenticate

  def show
    @user = current_user
    @bookmarks = Bookmark.all.where(user: current_user)
    @likes = User.liked_bookmarks(current_user)
  end
end
