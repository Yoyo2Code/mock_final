require 'rails_helper'

describe "Unauthorized visitor", :type => :feature do
  context "goes to signup" do
    it "states why they could not sign up" do
      user = create(:user)

      visit '/login'

      click_on 'Sign Up'

      fill_in :Username, with: "username"
      fill_in :Password, with: "newPassword"
      fill_in :user_password_confirmation, with: "newPassword"

      click_on 'Create User'

      expect(page).to have_content("Username already in use")
    end

    it "should redirect to links in index page if successful" do
      user = create(:user)

      visit '/login'

      click_on 'Sign Up'

      fill_in :Username, with: "newuser"
      fill_in :Password, with: "newPassword"
      fill_in :user_password_confirmation, with: "newPassword"

      click_on 'Create User'

      expect(page).to have_content("Username already in use")
    end
  end
end
