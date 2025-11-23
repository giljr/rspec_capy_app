require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user, views: 2) }  # capture the object
  # let(:user) { User.create!(email: "test@test.com", password: "password") }

  before(:each) do
    assign(:post, post)   # use the SAME object
    # assign(:post, Post.create!(
    #   title: "Title",
    #   body: "MyText",
    #   user: user,
    #   views: 2
    # ))
  end

  it "renders attributes in <p>" do
    render
    
    # Visual debug
    # puts rendered

    expect(rendered).to include(post.title)
    expect(rendered).to include(post.body)
    expect(rendered.downcase).to include("delete")
    expect(rendered).to include(post.views.to_s)

    # expect(rendered).to match(/Title/)
    # expect(rendered).to match(/MyText/)
    # expect(rendered).to match(/delete/)
    # expect(rendered).to match(/2/)
  end
end
