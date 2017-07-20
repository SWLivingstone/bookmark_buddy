class LikesController < ApplicationController
  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @topic = Topic.find_by(id: @bookmark.topic_id)
     like = current_user.likes.build(bookmark: @bookmark)

     if like.save
       redirect_to @topic, notice: "You have liked the bookmark #{@bookmark.title}."
     else
       flash.now[:alert] = "Error liking bookmark. Please try again."
       redirect_to @topic
     end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @topic = Topic.find_by(id: @bookmark.topic_id)
      like = current_user.likes.find_by(bookmark: @bookmark)
    if like.destroy
      redirect_to @topic, notice: "You have unliked the bookmark #{@bookmark.title}."
    else
      flash.now[:alert] = "Error unliking bookmark. Please try again."
      redirect_to @topic
    end
  end
end
