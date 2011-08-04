require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }
  subject { user }

  it "should sort correctly by name" do
    users = FactoryGirl.build_list(:user, 25)
    users.sort.should == users.sort do |a,b|
      a.name <=> b.name
    end
  end

  its(:to_s) { should eq(user.name) }
end
