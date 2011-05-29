require 'spec_helper'

describe User do
  before { @user = User.make_unsaved }
  subject { @user }

  its(:to_s) { should eq(@user.name) }

  context "with some registrations" do
    before do
      @reg1 = Registration.make_unsaved
      @reg1.stub!(:wins) { 5 }
      @reg1.stub!(:losses) { 10 }

      @reg2 = Registration.make_unsaved
      @reg2.stub!(:wins) { 2 }
      @reg2.stub!(:losses) { 1 }

      @user.registrations << @reg1
      @user.registrations << @reg2
    end

    its(:wins) { should eq(7) }
    its(:losses) { should eq(11) }
  end
end
