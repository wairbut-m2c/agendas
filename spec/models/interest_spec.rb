require 'rails_helper'

RSpec.describe Interest, type: :model do

  before do
    @interest = FactoryGirl.build(:interest)
  end

  it "should be valid" do
    expect(@interest).to be_valid
  end

end
