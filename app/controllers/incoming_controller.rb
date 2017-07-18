class IncomingController < ApplicationController

  def create
   puts "INCOMING PARAMS HERE: #{params}"

   @user = User.find_by(email: params[:sender])
   @topic = Topic.find_by(title: params[:subject])

   if @user == nil
     @user = User.create(email: params[:sender], password: RandomData.random_word)
   end

   if @topic == nil
     @topic = Topic.create(title: params[:subject])
   end

    @bookmarks_array = params["stripped-text"].split(/,/)

    @bookmarks_array.each do |bookmark|
      Bookmark.create(url: bookmark, topic: @topic)
    end

   head 200
  end
end
