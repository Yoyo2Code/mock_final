require 'rails_helper'

describe "Unauthorized visitor", :type => :feature do
  context "goes to signup" do
    it "states why they could not sign up" do
      user = create(:user)

      visit '/login'

      click_on 'Sign Up'

      fill_in :username, with: "username"
      fill_in :password, with: "newPassword"

      expect(page).to have_content("Email already exists")
    end
  end
end
