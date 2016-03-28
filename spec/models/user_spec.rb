require "rails_helper"

describe User do
  include ActiveJob::TestHelper

  describe ".from_omniauth" do
    before { clear_enqueued_jobs }

    context "when the user is new" do
      it "creates a new user from the oauth info" do
        User.from_omniauth(auth_hash)

        expect(User.all.count).to eq(1)
        expect(User.last.name).to eq(auth_hash["info"]["name"])
      end

      it "sends a welcome email" do
        User.from_omniauth(auth_hash)

        expect(enqueued_jobs.size).to eq(1)
      end
    end

    context "when the user already exists" do
      it "finds the existing user" do
        bruce = create(:user,
                       name: "Bruce Wayne",
                       email: "brucewayne@gmail.com",
                       provider: "facebook",
                       uid: "10255214431077214"
                      )

        found_user = User.from_omniauth(auth_hash)
        expect(found_user.id).to eq(bruce.id)
      end

      it "does not send a welcome email" do
        bruce = create(:user,
                       name: "Bruce Wayne",
                       email: "brucewayne@gmail.com",
                       provider: "facebook",
                       uid: "10255214431077214"
                      )

        expect(enqueued_jobs.size).to eq(0)
      end
    end
  end
end

def auth_hash
  {
    "provider" => "facebook",
    "uid" => "10255214431077214",
    "info" => {
      "email" => "brucewayne@gmail.com",
      "name"  => "Bruce Wayne",
      "image" => "http://graph.facebook.com/10255214431077214/picture"
    }
  }
end
