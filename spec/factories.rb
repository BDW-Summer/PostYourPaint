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
        color_family "Reds"
        name "Royal Red"
        hex "FF00ee"
        location 80304
        quantity 2
        additional_info "Yeah this is some legit paint. You should hop on this before it gets snatched up"
        user
  end       
    
end