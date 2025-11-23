module PostsHelper
  #
  # Navigation
  #

  def visit_posts_homepage
    visit posts_path
  end

  def visit_new_post_form
    visit new_post_path
  end

  def visit_post_show_page(post)
    visit post_path(post)
  end

  #
  # Posts Creation
  #

  def create_post_with(title:, body:)
    visit new_post_path

    fill_in "Title", with: title
    fill_in "Body",  with: body

    click_button "Create Post"
  end

  # Faker use
  def create_minimal_post
    create_post_with(
      title: Faker::Book.title,
      body:  Faker::Lorem.paragraph(sentence_count: 2)
    )
  end

  def create_post_with_views(title:, body:, views:)
    visit new_post_path

    fill_in "Title", with: title
    fill_in "Body",  with: body

    fill_in "Views", with: views if page.has_field?("Views")

    click_button "Create Post"
  end

  # Complete Post w/ Faker
  def create_random_post
    create_post_with(
      title: Faker::Book.title,
      body:  Faker::Lorem.paragraph(sentence_count: 3)
    )
  end

  #
  # Expectations
  #

  def i_should_see_post_title(title)
    expect(page).to have_content(title)
  end

  def i_should_see_post_body(body)
    expect(page).to have_content(body)
  end

  def i_should_see_form_errors
    expect(page).to have_selector(".field_with_errors")
  end

  def i_should_see_back_to_posts_link
    expect(page).to have_link("Back to posts", href: posts_path)
  end

  #
  # Listing
  #

  def i_should_see_posts_list
    expect(page).to have_selector("table")
  end

  def i_should_see_post_in_list(title)
    expect(page).to have_content(title)
  end

  #
  # Editing
  #

  def edit_post(post, new_title:, new_body:)
    visit edit_post_path(post)

    fill_in "Title", with: new_title
    fill_in "Body",  with: new_body

    click_button "Update Post"
  end

  def i_should_see_updated_post(new_title)
    expect(page).to have_content(new_title)
  end
end
