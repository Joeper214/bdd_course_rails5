require "rails_helper"

RSpec.feature "Users signin" do
  before do
    @joe = User.create!(email: "joe@example.com", password: "test_password")
  end
  
  scenario  "with valid credentials" do
    visit "/"
    
    click_link "Sign in"
    fill_in "Email", with: @joe.email
    fill_in "Password", with: @joe.password
    click_button "Log in"
    
    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Signed in as #{@joe.email}")
    expect(page).not_to have_link("Sign in")
    expect(page).not_to have_link("Sign up")
  end
end