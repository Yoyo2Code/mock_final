require 'rails_helper'

describe "Unauthorized visitor", :type => :feature do
  context "goes to signup" do
    it "states why they could not sign up" do
      user = create(:user)

      visit '/login'

      click_on 'Sign Up'

      fill_in :Username, with: "username"
      fill_in :Password, with: "newPassword"
      fill_in "Password confirmation", with: "newPassword"

      click_on 'Create User'

      expect(page).to have_content("Username has already been taken")
    end

    it "should redirect to links in index page if successful" do
      visit '/login'

      click_on 'Sign Up'

      fill_in :Username, with: "newuser"
      fill_in :Password, with: "newPassword"
      fill_in "Password confirmation", with: "newPassword"

      click_on 'Create User'

      expect(page).to have_content("User Successfully Created")
      expect(page.current_path).to eq("/")
    end
  end
end
