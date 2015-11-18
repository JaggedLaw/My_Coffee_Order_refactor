require 'test_helper'

class UnregisteredUserAuthenticationTest < ActionDispatch::IntegrationTest
  def create_user
    User.create(username: "user", password: "password")
  end

  test "unregistered user can register" do
    visit '/'

    click_link "Create Account"

    assert new_user_path, current_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert '/dashboard', current_path

    assert page.has_content?("Logged in as User")
    assert page.has_content?("User's Dashboard")
  end

  test "unregistered user can login" do
    create_user
    user = User.find_by(username: 'user')
    visit '/'

    assert page.has_link?("Login")
    click_link "Login"

    assert '/login', current_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"

    click_button "Login"

    assert dashboard_path, current_path
    assert page.has_content?("user has logged in
    ")
    assert page.has_content?("Username: user")

    refute page.has_link?("Login")
    assert page.has_link?("Logout")
  end

  test "logged in user can see coffee items" do
    create_category_and_items(1)
    logged_in_user


    visit items_path

    # save_and_open_page
    assert page.has_content?("Pour over0")
    assert page.has_content?("Drip0")
    assert page.has_content?("$4.00")

    click_link "Logout"

    assert page.has_content?("Login")
    refute page.has_content?("Logout")
  end
end
