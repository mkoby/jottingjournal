require 'spec_helper'

describe EntryLocation do
  before(:each) do
    @entry = FactoryGirl.create(:entry)
  end

  describe "should save city & state when given latitude and longitude" do
    before(:each) do
      @location = EntryLocation.create(:latitude => 29.76912849999999, :longitude => -95.7424118)
      @entry.location = @location
    end

    its(:city){ should == "Katy" }
    its(:state){ should == "TX" }
  end
end
