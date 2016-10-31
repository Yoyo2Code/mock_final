require 'rails_helper'

describe "User", :type => :feature do
    scenario "can signout" do
      user = create(:user)

      page.set_rack_session(user_id: user.id)

      visit '/'

      click_on 'Logout'

      expect(page.current_path).to eq("/login")

      expect(page).to have_content('Sign-in')
    end
end
