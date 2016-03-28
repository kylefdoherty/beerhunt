class User < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.from_omniauth(auth_hash)
    user = User.find_or_initialize_by(provider: auth_hash.fetch("provider"),
                                  uid: auth_hash.fetch("uid")
                                 )

    user_info = auth_hash.fetch("info")

    user.name = user_info.fetch("name")
    user.email = user_info.fetch("email")
    user.image_url = user_info.fetch("image")

    if user.new_record?
      user.save!
      WelcomeMailer.after_signup_welcome_email(user).deliver_later!
    end

    user
  end
end
