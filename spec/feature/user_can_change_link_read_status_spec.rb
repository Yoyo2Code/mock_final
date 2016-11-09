require 'rails_helper'

describe "User", type: :feature, js: true do
  context "on link index page" do
    it "can change read status to read" do
      user = create(:user)
      link = create(:link,
                    user_id: user.id,
                    title: "Google",
                    url_location: "http://www.Google.com"
                   )

      user.links << link

      page.set_rack_session(user_id: user.id)

      visit '/'

      expect(page).to have_content('Read: false')

      click_on "Mark as Read"

      expect(page).to have_content('Read: true')
      expect(page).to have_content('Mark as Unread')
      expect(page).to_not have_content('Mark as Read')
    end
    it "can change read status to unread" do
      user = create(:user)
      link = create(:link,
                    user_id: user.id,
                    title: "Google",
                    url_location: "http://www.Google.com",
                    read: 1
                   )

      user.links << link

      page.set_rack_session(user_id: user.id)

      visit '/'

      expect(page).to have_content('Read: true')

      click_on "Mark as Unread"

      expect(page).to have_content('Read: false')
      expect(page).to have_content('Mark as Read')
      expect(page).to_not have_content('Mark as Unread')
    end
  end
end
