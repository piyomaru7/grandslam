class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post  

  validates_uniqueness_of :post_id, scope: :user_id  #1人が1つの投稿に対して、1つしかいいねをつけられない
end
