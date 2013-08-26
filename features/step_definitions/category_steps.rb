Then /^a new category with name "(.*?)" should be created$/ do |category_name|
  matching_categories = Category.where name: category_name
  matching_categories.size.should eql 1
end

Given /^the following catego(?:ry|ries) exist(?:|s):$/ do |table|
  table.hashes.each do |category|
    Category.create! category
  end
end

Then /^there should be a category "(.+)" with description "(.+)"$/ do |name, description|
  category = Category.find_by_name name
  category.description.should eql description
end

Then /^there should be no category "(.+)"$/ do |name|
  category = Category.find_by_name name
  category.should be_nil
end
