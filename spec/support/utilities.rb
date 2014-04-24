
def sign_up(user)
    visit root_path
    click_on "Sign Up"
    fill_in :user_username, with: user.username
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password
    click_on "Sign up"
end
