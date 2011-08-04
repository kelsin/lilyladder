require 'spec_helper'

describe SmfAccount do
  let(:smf_account) { FactoryGirl.build(:smf_account) }
  subject { smf_account }

  it { should be_readonly }

  its(:user_params) { should == {
      :name => smf_account.member_name,
      :email => smf_account.email_address,
      :smf_id => smf_account.id_member,
      :admin => false } }
end
