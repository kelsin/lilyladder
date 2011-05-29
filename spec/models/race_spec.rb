require 'spec_helper'

describe Race do
  before { @race = Race.make_unsaved }
  subject { @race }

  its(:to_s) { should eq(@race.name) }
end
