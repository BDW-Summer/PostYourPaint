FactoryGirl.define do
  factory :user do
    email    "erik@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end