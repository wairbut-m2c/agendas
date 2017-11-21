require 'rails_helper'

RSpec.describe RepresentedEntity, type: :model do

  before do
    @represented_entity = FactoryGirl.build(:represented_entity)
  end

  it "should be valid" do
    expect(@represented_entity).to be_valid
  end

end
