def create_a_review

	visit('/restaurants')
	click_link('Review KFC')
	fill_in('Thoughts', with: 'so so')
	select '3', from: 'Rating'
	click_button('Leave Review')

end