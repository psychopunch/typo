Given /(?:|a|an) (.+) "(.+)" with password "(.+)" exists/ do |profile, login, password|
  profile = Profile.find_by_label(profile) || Profile.create(label: profile)
  User.create(login: login, password: password, profile: profile)
end
  
Given /^I am logged in as "(.+)" with password "(.+)"$/ do |user_name, password|
  visit '/accounts/login'
  fill_in 'user_login', with: user_name
  fill_in 'user_password', with: password
  click_button 'Login'
end

Given /the following (.+)s exist:/ do |table, dataset|
  setup_data table, dataset
end

def setup_data(table, dataset)
  model = Object.const_get table.capitalize
  dataset.hashes.each do |data|
    model.create data
  end
end
