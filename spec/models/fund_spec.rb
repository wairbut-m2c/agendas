require 'rails_helper'

RSpec.describe Fund, type: :model do

  before do
    @fund = FactoryGirl.build(:fund)
  end

  it "should be valid" do
    expect(@fund).to be_valid
  end

end
