require 'rails_helper'

describe "User", :type => :feature do
  context "on links index" do
    it "can add a link" do
      user = create(:user)

      page.set_rack_session(user_id: user.id)

      visit '/'
    end
  end
end
