require "rails_helper"

RSpec.describe "Posts Management", type: :system do
  include PostsHelper

  let(:user) { create(:user) }

  before { login_as(user, scope: :user) }

  describe "Homepage" do
    it "shows the posts list" do
      visit_posts_homepage
      i_should_see_posts_list
    end
  end
  describe "Creating a post" do
    it "creates a valid post" do
      visit_new_post_form
      create_post_with(
        title: "My First Post",
        body:  "This is the body"
      )
      i_should_see_post_title("My First Post")
      i_should_see_post_body("This is the body")
      i_should_see_back_to_posts_link
    end
    it "shows validation errors" do
      visit_new_post_form
      create_post_with(title: "", body: "")
      i_should_see_form_errors
    end
  end
  describe "Viewing a post" do
    it "shows a specific post page" do
      post = create(:post, title: "Show Title", body: "Show Body", user: user)
      visit_post_show_page(post)
      i_should_see_post_title("Show Title")
      i_should_see_post_body("Show Body")
    end
  end
  describe "Editing a post" do
    it "updates a post successfully" do
      post = create(:post, title: "Old Title", body: "Old Body", user: user)
      edit_post(
        post,
        new_title: "New Title",
        new_body:  "Updated Body"
      )
      i_should_see_updated_post("New Title")
      i_should_see_post_body("Updated Body")
    end
  end
end