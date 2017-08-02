class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #:confirmable

  has_many :topics
  has_many :bookmarks
  has_many :likes, dependent: :destroy

  def liked(bookmark)
   likes.where(bookmark_id: bookmark.id).first
  end

  def self.liked_bookmarks(user)
    Bookmark.joins("INNER JOIN likes ON likes.bookmark_id = bookmarks.id AND likes.user_id = #{user.id}")
  end
end
