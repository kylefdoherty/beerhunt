class Beer < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { minimum: 3, too_short: "name must be at least %{count} characters long" }
  validates :description, presence: true
end
