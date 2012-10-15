require 'spec_helper'

describe User do
  describe "entries" do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    context "zero entries" do
      it{ should respond_to(:entries) }
      its(:entries){ should be_empty }
    end
  end
end
