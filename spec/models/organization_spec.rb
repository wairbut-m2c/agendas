require 'rails_helper'

RSpec.describe Organization, type: :model do

  before do
    @organization = FactoryGirl.build(:organization)
  end

  it "should be valid" do
    expect(@organization).to be_valid
  end

end
