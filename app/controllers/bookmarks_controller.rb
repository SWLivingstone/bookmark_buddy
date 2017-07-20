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
    authorize @bookmark
    @bookmark.title = params[:bookmark][:title]
    @bookmark.url = params[:bookmark][:url]
    @bookmark.user = current_user

    if @bookmark.save
      redirect_to @topic, notice: "Bookmark was saved successfully."
    else
      flash.now[:alert] = "Error creating bookmark. Please try again."
      redirect_to @topic
    end
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
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
    authorize @bookmark

    if @bookmark.delete
      redirect_to :back, notice: "Bookmark was succesfully deleted"
    else
      flash.now[:alert] = "Error deleteing bookmark. Please try again"
      redirect_to :back
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end
end
