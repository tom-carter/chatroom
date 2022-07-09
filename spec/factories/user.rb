FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    handle { Faker::Name.unique.name  }
    password { Faker::Internet.password }
  end
end
