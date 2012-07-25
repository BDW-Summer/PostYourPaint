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
#         color_family "Reds"
        paint.association :color_family
        name "Royal Red"
        hex "FF00ee"
        location 80304
        quantity 2
        additional_info "Yeah this is some legit paint. You should hop on this before it gets snatched up"
        user
  end    
  
  factory.sequence :color_family_family do |n|
        "#{n}"
  end
  
  factory.define :color_family do |c|
    c.family Factory.next :color_family_family
  end
  
    
end