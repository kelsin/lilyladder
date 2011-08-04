require 'spec_helper'

describe Race do
  let(:race) { Race.where(:name => 'Zerg').first }
  subject { race }

  its(:to_s) { should eq(race.name) }
end
