require 'rails_helper'

RSpec.describe Contract, type: :model do

  before do
    @contract = FactoryGirl.build(:contract)
  end

  it "should be valid" do
    expect(@contract).to be_valid
  end

end
