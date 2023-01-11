require 'rails_helper'

RSpec.describe 'user edit state', :vcr do
  before :each do
    ActiveRecord::Base.connection.reset_pk_sequence!('users')

    visit root_path
      
    expect(page).to have_button("Login with Google")
    click_on "Login with Google"
    
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    # VCR.eject_cassette
    # VCR.insert_cassette('user can add or update state')
  
  end
  
  it 'lets a user add or update the state' do

    visit '/dashboard/edit'

    select 'Georgia', from: :state
    click_on "Submit"


    expect(current_path).to eq('/dashboard')

  
  end
end