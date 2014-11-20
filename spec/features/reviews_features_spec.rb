require 'rails_helper'

require 'helpers/user_sign_up'
require 'helpers/reviews_helper_spec'

describe 'reviewing' do
  before do
    Restaurant.create(name: 'KFC')
  end

def leave_review(thoughts, rating)
  visit('/restaurants')
  click_link "Review KFC"
  fill_in "Thoughts", with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end

  it 'displays an average rating for all reviews' do
    user_sign_up
    leave_review("so so", "3")
    click_link('Sign out')
    user_sign_up_two
    leave_review("Great!", "5")
    expect(page).to have_content("Average rating: ★★★★☆")
  end

  it 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  it 'returns five black stars for five' do
    restaurant = Restaurant.create(name: "The Ivy")
    restaurant.reviews.create(rating: 5)
    expect(restaurant.average_rating).to eq 5
  end

  it 'returns three black stars and two white stars for three' do
    restaurant = Restaurant.create(name: "The Ivy")
    restaurant.reviews.create(rating: 3)
    expect(restaurant.average_rating).to eq 3
  end

  it 'returns four black stars and one white star for 3.5' do
    restaurant = Restaurant.create(name: "The Ivy")
    restaurant.reviews.create(rating: 3)
    restaurant.reviews.create(rating: 4)
    expect(restaurant.average_rating).to eq 3.5
  end

end
