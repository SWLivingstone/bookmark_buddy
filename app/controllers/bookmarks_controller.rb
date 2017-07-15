class BookmarksController < ApplicationController
  include ApplicationHelper
  before_action :authenticate
  
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:bookmark][:topic])
    @bookmark = @topic.bookmarks.build
    @bookmark.title = params[:bookmark][:title]
    @bookmark.url = params[:bookmark][:url]

    if @bookmark.save
      redirect_to @topic, notice: "Bookmark was saved successfully."
    else
      flash.now[:alert] = "Error creating bookmark. Please try again."
      redirect_to @topic
    end
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.title = params[:bookmark][:title]
    @bookmark.url = params[:bookmark][:url]

    if @bookmark.save
      redirect_to @bookmark.topic, notice: "Bookmark was saved successfully."
    else
      flash.now[:alert] = "Error editing bookmark. Please try again."
      redirect_to @bookmark.topic
    end

  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.delete
      redirect_to @bookmark.topic, notice: "Bookmark was succesfully deleted"
    else
      flash.now[:alert] = "Error deleteing bookmark. Please try again"
      redirect_to @bookmark.topic
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end
end
