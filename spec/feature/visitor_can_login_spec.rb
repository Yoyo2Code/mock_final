require 'rails_helper'

describe "Visitor", type: :feature do
  context 'not logged in' do
    xit "can login" do
      user = create(:user)

      visit '/'

      expect(page.current_path).to eq('/login')

      fill_in :session_username, with: user.username
      fill_in :session_password, with: user.password

      save_and_open_page

      expect(page).to have_content("Successfully logged in as #{user.username}")
      expect(page).to have_content("Links Index")
    end
  end
end
