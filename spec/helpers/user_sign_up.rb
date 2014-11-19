def user_sign_up

	visit('/')
	click_link('Sign up')
	fill_in('Email', with: 'test@test.com')
	fill_in('Password', with: 'testtest')
	fill_in('Password confirmation', with: 'testtest')
	click_button('Sign up')

end

def user_sign_up_two
	visit('/')
	click_link('Sign up')
	fill_in('Email', with: 'test2@test.com')
	fill_in('Password', with: 'testtest')
	fill_in('Password confirmation', with: 'testtest')
	click_button('Sign up')
end