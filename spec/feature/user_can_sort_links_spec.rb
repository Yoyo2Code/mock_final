require 'rails_helper'

describe 'User', type: :feature, js: true do
  context "on home page" do
    it "can sort alphabetically" do
      user = create(:user)
      link = create(:link,
                    user_id: user.id,
                    title: "Google",
                    url_location: "http://www.Google.com"
                   )

      link2 = create(:link,
                    user_id: user.id,
                    title: "Bing",
                    url_location: "http://www.Bing.com",
                    read: "true"
                   )

      user.links << link << link2

      page.set_rack_session(user_id: user.id)

      visit '/'

    end

    it "can sort read links" do
      user = create(:user)
      link = create(:link,
                    user_id: user.id,
                    title: "Google",
                    url_location: "http://www.Google.com"
                   )

      link2 = create(:link,
                    user_id: user.id,
                    title: "Bing",
                    url_location: "http://www.Bing.com",
                    read: "true"
                   )

      user.links << link << link2

      page.set_rack_session(user_id: user.id)

      visit '/'
    end

    it "can sort unread links" do
      user = create(:user)
      link = create(:link,
                    user_id: user.id,
                    title: "Google",
                    url_location: "http://www.Google.com"
                   )

      link2 = create(:link,
                    user_id: user.id,
                    title: "Bing",
                    url_location: "http://www.Bing.com",
                    read: "true"
                   )

      user.links << link << link2

      page.set_rack_session(user_id: user.id)

      visit '/'
    end
  end
end
