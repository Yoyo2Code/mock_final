require 'rails_helper'

describe 'User', type: :feature, js: true do
  context "on home page" do
    xit "can sort alphabetically" do
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

      links = page.all("div #link")

    end

    xit "can sort read links" do
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

    xit "can sort unread links" do
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
