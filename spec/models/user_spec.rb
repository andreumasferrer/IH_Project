require "rails_helper"

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it "returns a contact's full name as a string"
end
