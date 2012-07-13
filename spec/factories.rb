FactoryGirl.define do
  factory :user do
      sequence(:email)   { |n| "Person #{n}@example.com" }
      password "foobar"
      password_confirmation "foobar"
      
      factory :admin do 
        admin true
      end
  end
  
  factory :paint do 
    color_family "Red"
    name "Ruby"
    hex "ff0000"
    location 80304
    quantity 2
    additional_info "Lorem ipsum"
    user
  end
end