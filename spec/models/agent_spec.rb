require 'rails_helper'

RSpec.describe Agent, type: :model do

  before do
    @agent = FactoryGirl.build(:agent)
  end

  it "should be valid" do
    expect(@agent).to be_valid
  end

end
