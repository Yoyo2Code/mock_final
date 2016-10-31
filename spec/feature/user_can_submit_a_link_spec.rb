require 'rails_helper'

describe "User", :type => :feature do
  context "on links index" do
    it "can add a link" do
      user = create(:user)

      page.set_rack_session(user_id: user.id)

      visit '/'

      expect(page).to have_content('Links Index')

      fill_in :link_title, with: "Google"
      fill_in :link_url_location, with: "http://www.google.com"

      click_on "Create Link"

      expect(page).to have_content("Google")
      # expect(page).to have_content("http://www.google.com")
    end
  end
end
