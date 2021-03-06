require 'faker'

FactoryGirl.define do

  factory :agent do
    identifier { Faker::Number.number(10) }
    name { Faker::Name.first_name }
    first_surname { Faker::Name.last_name }
    second_surname { Faker::Name.last_name }
    from Time.zone.yesterday
    to Time.zone.today
    public_assignments "text"
    association :organization, factory: :organization
  end

end
