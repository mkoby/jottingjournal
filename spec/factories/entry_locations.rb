# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry_location do
    entry nil
    latitude ""
    longitude ""
    city "MyString"
    state "MyString"
  end
end
