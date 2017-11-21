require 'rails_helper'

RSpec.describe Category, type: :model do

  before do
    @category = FactoryGirl.build(:category)
  end

  it "should be valid" do
    expect(@category).to be_valid
  end

end
