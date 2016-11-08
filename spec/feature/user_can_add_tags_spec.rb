require 'rails_helper'

describe 'User', type: :feature, js: true do
  context 'on home page' do
    it 'can add tags' do
      user = create(:user)
      link = create(:link, user_id: user.id)

      page.set_rack_session(user_id: user.id)

      visit '/'

      within('#link') do
        fill_in "Add Tags...", with: 'Funny'
        click_on 'Add Tags'
      end

      expect(page).to have_content('Funny')

      expect(page).to have_css('.tag')
    end

    xit "can add tags seperated by commas" do
      user = create(:user)
      link = create(:link)

      page.set_rack_session(user_id: user.id)

      visit '/'

      fill_in 'apply-t', with: 'Funny, Fun, Sad, Monday'

      click_on 'Submit'

      expect(page).to have_content('Funny')
      expect(page).to have_content('Fun')
      expect(page).to have_content('Sad')
      expect(page).to have_content('Monday')

      all_tags_count = find('.tag').count
      expect(all_tags_count).to eq(4)
    end
  end
end
