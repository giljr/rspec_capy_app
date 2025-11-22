require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  let(:user) { User.create!(email: "test@test.com", password: "password") }

  before(:each) do
    assign(:post, Post.create!(
      title: "Title",
      body: "MyText",
      user: user,
      views: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    
    # Visual debug
    # puts rendered

    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/delete/)
    expect(rendered).to match(/2/)
  end
end
