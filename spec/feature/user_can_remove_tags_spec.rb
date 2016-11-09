require 'rails_helper'

describe 'Logged in User', type: :feature, js: true do
  context "on home page" do
    xit "can remove tags from a link" do
      user = create(:user)
      link = create(:link, user_id: user.id)

      page.set_rack_session(user_id: user.id)

      visit '/'

      within('#link') do
        fill_in "Add Tags...", with: 'Funny'
        click_on 'Add Tags'
      end

      expect(page).to have_content("Funny")

      within('#link') do
        fill_in "Add Tags...", with: 'Funny'
        click_on 'Delete Tag'
      end

      expect(page).to_not have_content("Funny")

    end

    xit "can remove tags from a link from database" do
      user = create(:user)
      link = create(:link, user_id: user.id)

      page.set_rack_session(user_id: user.id)

      visit '/'

      within('#link') do
        fill_in "Add Tags...", with: 'Funny'
        click_on 'Add Tags'
      end

      expect(page).to have_content("Funny")

      within('#link') do
        fill_in "Add Tags...", with: 'Funny'
        click_on 'Delete Tag'
      end

      expect(page).to_not have_content("Funny")

      visit '/'

      expect(page).to_not have_content("Funny")
    end
  end
end
