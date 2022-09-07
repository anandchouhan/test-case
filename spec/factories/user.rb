FactoryBot.define do
  factory :user do
    first_name { "test" }
    last_name { "user" }
    email { "test@test.com" }
    age { 40 }
  end

  # factory :user do
  #   name { "test" }
  #   email { "test@test.com" }
  #   age { "40" }
  # end
end



