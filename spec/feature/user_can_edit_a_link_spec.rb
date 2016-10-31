require 'rails_helper'

describe 'User', type: :feature do
  context 'on home page' do
    it 'click on edit button' do
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

      

    end
  end
end
