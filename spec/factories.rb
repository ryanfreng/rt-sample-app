FactoryGirl.define do
  factory :user do
    name      "Ryan Freng"
    email     "ryanfreng@example.com"
    password  "foobar"
    password_confirmation "foobar"
  end
end