Then /^a new category with name "(.*?)" should be created$/ do |category_name|
  matching_categories = Category.where name: category_name
  matching_categories.size.should eql 1
end
