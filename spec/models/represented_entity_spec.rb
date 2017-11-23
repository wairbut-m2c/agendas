require 'rails_helper'

describe RepresentedEntity do

  let(:represented_entity) { build(:represented_entity) }

  it "should be valid" do
    expect(represented_entity).to be_valid
  end

  it "should not be valid whitout name" do
    represented_entity.name = nil

    expect(represented_entity).not_to be_valid
  end

  it "should not be valid whitout identifier" do
    represented_entity.identifier = nil

    expect(represented_entity).not_to be_valid
  end

  it "should not be valid whitout from" do
    represented_entity.from = nil

    expect(represented_entity).not_to be_valid
  end

  it "should not be valid whitout fiscal_year" do
    represented_entity.fiscal_year = nil

    expect(represented_entity).not_to be_valid
  end

end
