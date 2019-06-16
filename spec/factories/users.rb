FactoryBot.define do
  factory :user do
    name { "sunny" }
    email { "sunny@yahooo.com" }
    password { "012345" }
    password_confirmation { "012345" }
  end
end
