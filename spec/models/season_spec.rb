require 'spec_helper'

describe Season do
  before { @season = FactoryGirl.build(:season) }
  subject { @season }

  it "should sort by name" do
    seasons = FactoryGirl.build_list(:season, 25)
    seasons.sort.should == seasons.sort do |a,b|
      a.name <=> b.name
    end
  end

  its(:to_s) { should eq(@season.name) }
end
