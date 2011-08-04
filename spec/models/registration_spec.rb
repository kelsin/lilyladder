require 'spec_helper'

describe Registration do
  context "with 4 registrations" do
    before do
      @reg1 = FactoryGirl.build(:registration)
      @reg2 = FactoryGirl.build(:registration)
      @reg3 = FactoryGirl.build(:registration)
      @reg4 = FactoryGirl.build(:registration)

      @reg1.stub(:wins) { 1 }
      @reg2.stub(:wins) { 3 }
      @reg3.stub(:wins) { 1 }
      @reg4.stub(:wins) { 1 }

      @reg1.stub(:losses) { 3 }
      @reg2.stub(:losses) { 3 }
      @reg3.stub(:losses) { 3 }
      @reg4.stub(:losses) { 1 }

      @reg1.stub_chain(:user, :name).and_return('b')
      @reg2.stub_chain(:user, :name).and_return('b')
      @reg3.stub_chain(:user, :name).and_return('a')
      @reg4.stub_chain(:user, :name).and_return('b')
    end

    subject { [@reg1, @reg2, @reg3, @reg4] }

    its(:sort) { should eq([@reg2, @reg4, @reg3, @reg1]) }
  end
end
