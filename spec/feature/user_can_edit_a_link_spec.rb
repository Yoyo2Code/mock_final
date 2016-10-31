require 'rails_helper'

describe 'User', type: :feature do
  context 'on home page' do
    it 'can edit link' do
      user = create(:user)
      link = create(:link,
                    user_id: user.id,
                    title: "Google",
                    url_location: "http://www.Google.com"
                   )

      user.links << link

      page.set_rack_session(user_id: user.id)

      visit '/'

      click_on "Edit"

      fill_in :Title, with: "New Google"

      click_on "Update Link"

      expect(page.current_path).to eq("/")

      expect(page).to have_content("New Google")
    end

    it 'can recieve error messages with invalid edit' do
      user = create(:user)
      link = create(:link,
                    user_id: user.id,
                    title: "Google",
                    url_location: "http://www.Google.com"
                   )

      user.links << link

      page.set_rack_session(user_id: user.id)

      visit '/'

      click_on "Edit"

      fill_in :link_url_location, with: "google.ne"

      click_on "Update Link"

      expect(page).to have_content("is not a valid URL")
    end
  end
end
