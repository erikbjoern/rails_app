feature 'User can create account' do
    context 'User can register an email and a password' do
        before do
            visit new_admin_registration_sign_up_path
            fill_in ''
        end

        end
        it 'receives confirmation notice when account is created' do
            
        end
    end
end