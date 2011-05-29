require 'spec_helper'

describe Registration do
  context "with 4 registrations" do
    before do
      @reg1 = Registration.make_unsaved
      @reg2 = Registration.make_unsaved
      @reg3 = Registration.make_unsaved
      @reg4 = Registration.make_unsaved

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
