require 'rails_helper'

RSpec.describe ComunicationRepresentant, type: :model do

  before do
    @comunication_representant = FactoryGirl.build(:comunication_representant)
  end

  it "should be valid" do
    expect(@comunication_representant).to be_valid
  end

end
