require 'spec_helper'

describe Race do
  let(:race) { FactoryGirl.build(:race) }
  subject { race }

  its(:to_s) { should eq(race.name) }
end
