Given /user "(.+)" wrote articles/ do |user, contents|
  author = User.find_by_login user
  contents.hashes.each do |content|
    author.articles.build content
  end
  author.save!
end
