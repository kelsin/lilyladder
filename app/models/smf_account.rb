require 'digest/sha1'

class SmfAccount < ActiveRecord::Base
  SMF_URL = URI(ENV['SMF_URL'])
  establish_connection(:adapter => SMF_URL.scheme,
                       :host => SMF_URL.host,
                       :port => SMF_URL.port,
                       :username => SMF_URL.user,
                       :password => SMF_URL.password,
                       :database => SMF_URL.path[1..-1])

  set_table_name 'smf2rc4_members'
  set_primary_key :id_member

  def self.authenticate(login, password)
    self.where(:member_name => login, :passwd => Digest::SHA1.hexdigest("#{login}#{password}")).first
  end

  def user_params
    { :name => self.member_name,
      :email => self.email_address,
      :smf_id => self.id_member,
      :admin => self.id_group == 1 }
  end

  def user
    User.create!(user_params)
  rescue
    User.where(:smf_id => self.id_member).first.tap do |u|
      u.update_attributes(user_params) if u
    end
  end

  def readonly?
    true
  end
end
