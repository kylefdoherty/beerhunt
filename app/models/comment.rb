class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer

  validates :user_id, presence: true
  validates :beer_id, presence: true
end
