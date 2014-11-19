def create_a_restaurant

	visit('/')
	click_link('Add a restaurant')
	fill_in('Name', with: 'KFC')
	click_button('Create Restaurant')

end