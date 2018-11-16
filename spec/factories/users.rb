FactoryBot.define do
 factory :user do
    username { Faker::HeyArnold.character }
    password 'abcdef'

    factory :harry_potter do
      username 'harry_potter'
      password 'abcdef'
    end
  end
end
