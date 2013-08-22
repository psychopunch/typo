Given /^I am logged in as (.+) with password (.+)$/ do |user_name, password|
  visit '/accounts/login'
  fill_in 'user_login', with: user_name
  fill_in 'user_password', with: password
  click_button 'Login'
end
