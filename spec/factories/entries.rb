# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    association :user
    contents "This is is a new journal entry"
  end
end
