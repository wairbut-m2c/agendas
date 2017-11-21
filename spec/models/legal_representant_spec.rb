require 'rails_helper'

RSpec.describe LegalRepresentant, type: :model do

  before do
    @legal_representant = FactoryGirl.build(:legal_representant)
  end

  it "should be valid" do
    expect(@legal_representant).to be_valid
  end

end
