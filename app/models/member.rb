class Member < ActiveRecord::Base
  set_table_name :smf_members

  def self.authenticate(name, password)
    Member.where(:member_name => name, :passwd => Digest::SHA1.hexdigest("#{name.downcase}#{password}")).first
    # TODO Create or find a User based on this member
  end
end
