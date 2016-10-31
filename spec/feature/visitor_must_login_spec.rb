require 'rails_helper'

describe "Unauthorized visitor", :type => :feature do
  context "visits homepage" do
    it "gets prompted to login" do

      visit '/'

      expect(page.current_url).to eq '/login'

      expect(page).to have_content('Log In or Sign Up')
    end
  end
end
