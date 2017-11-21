require 'faker'

FactoryGirl.define do
  factory :contract do
    entity_name { Faker::Company.name }
    sequence(:name) { |n| "Contract name #{n}" }
    association :organization, factory: :organization
  end

end
