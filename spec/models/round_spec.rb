require 'spec_helper'

describe Round do
  context "with a position of 2" do
    let(:round) { FactoryGirl.build(:round, :position => 2) }
    subject { round }

    its(:to_s) { should eq("Round #{round.position}") }
  end
end
