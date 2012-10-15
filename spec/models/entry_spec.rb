require 'spec_helper'

describe Entry do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  describe "new entries" do
    before(:each) do
      @contents = "My new journal entry text"
      @entry = Entry.create(FactoryGirl.attributes_for(:entry, :user => @user, :contents => @contents))
    end

    subject{ @entry }
    its(:contents){ should == @contents }
    its(:entry_hash){ should_not be_nil }
  end
end
