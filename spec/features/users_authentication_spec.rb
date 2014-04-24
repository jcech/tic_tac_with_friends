require 'spec_helper'

describe User do
  it 'allows a new user to create an account' do
    user = build(:user)
    visit root_path
    click_on "Sign Up"
    fill_in :user_username, with: user.username
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password
    click_on "Sign up"
    page.should have_content "Signed in as"
  end

  it 'allows a user to sign in' do
    user = create(:user)
    visit root_path
    click_on "Sign In"
    fill_in :user_username, with: user.username
    fill_in :user_password, with: user.password
    click_on 'Sign in'
    page.should have_content "Signed in as #{user.username}"
  end

  it 'allows a user to sign out' do
    user = build(:user)
    sign_up(user)
    click_on 'Sign Out'
    page.should have_content 'Signed out successfully.'
  end
  # it 'allows a user to edit an account' do
  #   user = FactoryGirl.build(:user)
  #   sign_up(user)
  #   click_link user.name
  #   click_link "Edit Profile"
  #   fill_in :user_name, with: "New Name"
  #   fill_in :user_current_password, with: user.password
  #   click_button "Update"
  #   page.should have_content "New Name"
  # end
end
