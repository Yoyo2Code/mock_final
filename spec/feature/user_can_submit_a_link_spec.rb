require 'rails_helper'

describe "User", :type => :feature do
  context "on links index" do
    it "can add a link" do
      user = create(:user)

      page.set_rack_session(user_id: user.id)

      visit '/'

      expect(page).to have_content('Links Index')

      fill_in :title, with: "Google"
      fill_in :url, with: "http://www.google.com"

      click_on "Create Link"

      save_and_open_page

      expect(page).to have_content("Google")
      # expect(page).to have_content("http://www.google.com")
    end
  end
end
