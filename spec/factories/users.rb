# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "user_#{n}@jottjournal.com"
  end

  factory :user do
    email
    password "testpassword"
    password_confirmation "testpassword"
  end
end
