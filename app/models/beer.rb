class Beer < ActiveRecord::Base
  has_many :likes
  has_many :comments

  validates :name, presence: true
  validates :name, length: { minimum: 3, too_short: "name must be at least %{count} characters long" }
  validates :description, presence: true

  def liked_by_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
