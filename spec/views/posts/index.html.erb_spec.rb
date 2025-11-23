require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  let(:user) { create(:user) }
  # let(:user) { User.create!(email: "test@test.com", password: "password") }

  before(:each) do
    @posts = create_list(:post, 2, user: user)
    assign(:posts, @posts)
    # assign(:posts, [
    #   Post.create!(
    #     title: "Title",
    #     body: "MyText",
    #     user: user,
    #     views: 2
    #   ),
    #   Post.create!(
    #     title: "Title",
    #     body: "MyText",
    #     user: user,
    #     views: 2
    #   )
    # ])
  end

  it "renders a list of posts" do
    render

    # Visual debug
    # puts rendered

    # The text "Title" should appear four times
    # expect(rendered.scan(/Title/).count).to eq(4)

    # Check "Show this post" links appear twice
    # expect(rendered.scan(/Show this post/).count).to eq(2)
    # ensure each post title appears in the table
    
    @posts.each do |post|
      expect(rendered).to include(post.title)
    end

    # ensure each "Show" link appears once per post
    expect(rendered.scan(/Show/).count).to eq(@posts.count)
  end
end
