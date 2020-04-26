FactoryBot.define do
  factory :article do
    title { "MyString" }
    content { "MyText" }
    user_id { current_user.id }
  end
end

