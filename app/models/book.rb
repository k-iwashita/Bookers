class Book < ApplicationRecord
	belongs_to :user
	validates :title, presence: true
	validates :body ,presence: true, length: {maximum: 200}

  has_many :favorites
  has_many :book_comments

  def favorited_by?(user, book)
    Favorite.where(user_id: user.id, book_id: book.id).exists?
  end
end
