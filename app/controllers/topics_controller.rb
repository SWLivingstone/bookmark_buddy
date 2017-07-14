class TopicsController < ApplicationController
  include ApplicationHelper
  before_action :authenticate

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = Topic.new
    @topic.title = params[:topic][:title]

    if @topic.save
      redirect_to topics_path, notice: "Topic was saved successfully."
    else
      flash.now[:alert] = "Error creating topic. Please try again."
      redirect_to topics_path
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.delete
      redirect_to topics_path, notice: "Topc was succesfully deleted"
    else
      flash.now[:alert] = "Error deleteing topic. Please try again"
      redirect_to @topic
    end
  end

end
