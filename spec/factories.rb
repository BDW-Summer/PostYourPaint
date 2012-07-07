FactoryGirl.define do
  factory :user do
      sequence(:email)   { |n| "Person #{n}@example.com" }
      password "foobar"
      password_confirmation "foobar"
      
      factory :admin do 
        admin true
      end
  end
end