require 'rails_helper'

describe "Links search", type: :feature, js: true do
  context "using search input box" do
    it "filters links" do
      user = create(:user)
      link = create(:link,
                    user_id: user.id,
                    title: "Google",
                    url_location: "http://www.Google.com"
                   )

      user.links << link

      page.set_rack_session(user_id: user.id)

      visit '/'

      expect(page).to have_content("Google")

      fill_in :search, with: "Bing"

      expect(page).to_not have_content("Google")
    end
  end
end
