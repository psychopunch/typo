Given /user "(.+)" wrote articles/ do |user, contents|
  author = User.find_by_login user
  contents.hashes.each do |content|
    author.articles.build content
  end
  author.save!
end

And /"(.+)" commented "(.+)" on "(.+)"/ do |login, message, article|
  article = Article.find_by_title article
  user = User.find_by_login login
  article.comments.build author: login, body: message, user: user
  article.save!
end

And /I fill in "(.+)" with id of article "(.+)"/ do |input_field, article_title|
  article = Article.find_by_title article_title
  step %Q{I fill in "#{input_field}" with "#{article.id}"}
end

And /article "(.+)" should be deleted/ do |title|
  articles = Article.where title: title
  articles.should be_empty
end

And /article "(.+)" should have the comments/ do |title|
  article = Article.find_by_title title
  article.comments.size.should eql Comment.find(:all).size
end
