require 'spec_helper'

describe Season do
  before { @season = Season.make_unsaved }
  subject { @season }

  its(:to_s) { should eq(@season.name) }

  context "with 5 registrations" do
    before { 5.times { @season.registrations << Registration.make_unsaved(:season => @season) } }

    its(:players) { should eq(@season.registrations.sort) }

    its(:number_of_groups) { should eq(1) }
    its(:group_size) { should eq(5) }
  end

  context "with 33 registrations" do
    before { @season.registrations.stub(:size) { 33 } }

    its(:number_of_groups) { should eq(1) }
    its(:group_size) { should eq(33) }
  end

  context "with 73 registrations" do
    before { @season.registrations.stub(:size) { 73 } }

    its(:number_of_groups) { should eq(2) }
    its(:group_size) { should eq(36) }
  end

  context "with 74 registrations" do
    before { @season.registrations.stub(:size) { 74 } }

    its(:number_of_groups) { should eq(2) }
    its(:group_size) { should eq(37) }
  end

  context "with two seasons" do
    before { @other_season = Season.make_unsaved }

    it "should sort correctly" do
      @season.<=>(@other_season).should == @season.name.<=>(@other_season.name)
    end
  end
end
