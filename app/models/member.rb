class Member < ActiveRecord::Base
  set_table_name :smf_members

  def self.authenticate(name, password)
    Member.where(:member_name => name, :passwd => Member.hash_password(name, password)).first
    # TODO Create or find a User based on this member
  end

  def self.hash_password(name, password)
    Digest::SHA1.hexdigest("#{name.downcase}#{password}")
  end
end
