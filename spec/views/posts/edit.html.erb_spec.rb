require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  let(:user) { create(:user) }
  # let(:user) { User.create!(email: "test@test.com", password: "password") }

  let(:post) { create(:post, user: user) }
  # let(:post) {
  #   Post.create!(
  #     title: "MyString",
  #     body: "MyText",
  #     user: user,
  #     views: 1
  #   )
  # }

  before(:each) do
    assign(:post, post)
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(post), "post" do

      assert_select "input[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[body]"

    end
  end
end
