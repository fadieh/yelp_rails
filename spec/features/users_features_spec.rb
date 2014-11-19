require 'rails_helper'

require 'helpers/user_sign_up'
require 'helpers/create_a_restaurant'
require 'helpers/create_a_review'

context "user not signed in and on the homepage" do
  it "should see a 'sign in' link and a 'sign up' link" do
    visit('/')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end

  it "should not see 'sign out' link" do
    visit('/')
    expect(page).not_to have_link('Sign out')
  end

  # it "should not be able to create a restaurant if not logged in" do
  #   visit('/')
  #   click_link('Add a restaurant')
  #   expect(page).to have_link('Add a restaurant')
  # end

end

context "user signed in on the homepage" do

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  it "should see 'sign out' link" do
    visit('/')
    expect(page).to have_link('Sign out')
  end

  it "should not see a 'sign in' link and a 'sign up' link" do
    visit('/')
    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end
end

  context "user signed in features" do

  it 'user must be logged in to create restaurants' do
    visit('/')
    expect(page).not_to have_link('Add a restaurant')
    user_sign_up
    expect(page).to have_link('Add a restaurant')
  end


  it 'user can only edit/delete restaurants theyve created' do
    visit('/')
    user_sign_up
    create_a_restaurant
    expect(page).to have_link('Edit KFC')
    expect(page).to have_link('Delete KFC')
  end

  it 'user can only leave 1 review per restaurant' do
    visit('/')
    user_sign_up
    create_a_restaurant
    create_a_review
    expect(page).not_to have_link('Review KFC')
  end

  it 'user can delete their own review' do
    visit('/')
    user_sign_up
    create_a_restaurant
    create_a_review
    expect(page).to have_link('Delete review')
    click_link('Sign out')
    user_sign_up_two
    expect(page).not_to have_link('Delete review')

  end

end

  # it "can only leave 1 review per restaurant" do
  # end

  # it "users can delete their own review" do
  # end

