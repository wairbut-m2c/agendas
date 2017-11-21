require 'faker'

FactoryGirl.define do
  factory :subvention do
    entity_name { Faker::Company.name }
    sequence(:name) { |n| "Subvention name #{n}" }
    association :organization, factory: :organization
  end

end
