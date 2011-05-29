require 'spec_helper'

describe User do
  before { @user = User.make_unsaved }
  subject { @user }

  its(:to_s) { should eq(@user.name) }
end
