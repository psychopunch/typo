Given /user "(.+)" wrote articles/ do |user, contents|
  author = User.find_by_login user
  contents.hashes.each do |content|
    author.articles.build content
  end
  author.save!
end

And /I fill in "(.+)" with id of article "(.+)"/ do |input_field, article_title|
  article = Article.find_by_title article_title
  step %Q{I fill in "#{input_field}" with "#{article.id}"}
end
