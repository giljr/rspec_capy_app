require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  let(:user) { User.create!(email: "test@test.com", password: "password") }

  before(:each) do
    assign(:post, Post.new(
      title: "MyString",
      body: "MyText",
      user: user,
      views: 1
    ))
  end

  it "renders new post form" do
    render

    # Visual debug
    # puts rendered

    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "input[name=?]", "post[title]"
      assert_select "textarea[name=?]", "post[body]"
      assert_select "input[name=?]", "post[views]"
    end
  end
end
