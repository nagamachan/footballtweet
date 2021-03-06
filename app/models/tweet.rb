class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy # commentsテーブルとのアソシエーション
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def self.search(search)
    return Tweet.all unless search
    Tweet.where('text LIKE(?)', "%#{search}%")
  end
end
