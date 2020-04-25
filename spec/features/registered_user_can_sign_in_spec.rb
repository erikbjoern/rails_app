feature 'Registered user can sign in' do
    context 'through link on index page' do
        let(:user) { create(:user) }
        before do
            visit root_path
            click_on 'Sign in'
            fill_in 'Email', with: user.email
            fill_in 'Password', with: user.password
        end

        it 'user should see welcome message' do
            expect(page).to have_content 'Welcome'    
        end
    end
end