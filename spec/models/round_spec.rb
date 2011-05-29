require 'spec_helper'

describe Round do
  context "with a position of 2" do
    before { @round = Round.make_unsaved(:position => 2) }
    subject { @round }

    its(:to_s) { should eq("Round #{@round.position}") }
  end
end
