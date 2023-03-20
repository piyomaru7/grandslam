class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :text, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
