require 'rails_helper'

xdescribe "User", :type => :feature do
    scenario "can signout" do
      user = create(:user)

      page.set_rack_session(user_id: user.id)

      visit '/'

      click_on 'Log Out'

      expect(page).to have_content('Sign-in')
    end
end
