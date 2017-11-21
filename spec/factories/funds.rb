require 'faker'

FactoryGirl.define do
  factory :fund do
    entity_name { Faker::Company.name }
    year Date.current.year
    ammount "1000"
    association :organization, factory: :organization
  end

end
