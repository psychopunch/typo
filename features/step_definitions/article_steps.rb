Given /user "(.+)" wrote articles/ do |user, contents|
  author = User.find_by_login user
  contents.rows_hash.each do |content|
    article = Article.new content
    article.user = author
    article.save
  end
end
