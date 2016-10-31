require 'rails_helper'

describe "Visitor", type: :feature do
  context 'not logged in' do
    it "can login" do
      user = create(:user)

      visit '/'

      expect(page.current_path).to eq('/login')

      fill_in :Username, with: user.username
      fill_in :Password, with: user.password

      expect(page).to have_content("Successfully logged in as #{user.username}")
      expect(page).to have_content("Links Index")
    end
  end
end
