require 'rails_helper'

RSpec.describe Subvention, type: :model do

  before do
    @subvention = FactoryGirl.build(:subvention)
  end

  it "should be valid" do
    expect(@subvention).to be_valid
  end

end
