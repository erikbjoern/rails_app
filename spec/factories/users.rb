FactoryBot.define do
  factory :user do
    email { 'user@email' }
    encrypted_password { 'userpassword' }
  end
end
