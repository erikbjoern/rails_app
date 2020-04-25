feature 'User can create account' do
    context 'User can register an email and a password' do
        before do
            visit new_admin_registration_path
            ''
            fill_in 'Email', with: 'admin@adminmail.com'
            fill_in 'Password', with: '12345678'
            fill_in 'Password confirmation', with: '12345678'
            click_on 'Sign up'
        end

        it 'receives confirmation notice when account is created' do
            expect(page).to have_content 'Welcome! You have signed up successfully.'
        end
    end
end