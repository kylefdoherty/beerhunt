class User < ActiveRecord::Base
  def self.from_omniauth(auth_hash)
    user = User.find_or_create_by(provider: auth_hash.fetch("provider"),
                                  uid: auth_hash.fetch("uid")
                                 )

    user_info = auth_hash.fetch("info")
    user.name = user_info.fetch("name")
    user.email = user_info.fetch("email")
    user.image_url = user_info.fetch("image")
    user.save!
    user
  end
end
