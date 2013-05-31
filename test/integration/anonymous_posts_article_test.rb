require 'test_helper'

class AnonymousPostsArticleTest < ActionDispatch::IntegrationTest

  test "view list of articles" do
    Post.create!(title: "First Post!!", body: "This is awkward.... I have nothing to say :(")
    Post.cretae!(title: "Wow, it's been a while!", body: "And yet, I'm still not a writer :( lol")

    visit '/'
    click_link "View All Posts"
    assert_current_path '/posts'
    assert_include page.content, "First Post!!"
    assert_include page.content, "Wow, it's been a while!"
  end

end
