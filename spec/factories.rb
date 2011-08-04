require 'digest/sha1'

FactoryGirl.define do
  sequence :name do |n|
    "Season #{n}"
  end

  sequence :race do |n|
    ['Random','Zerg','Protoss','Terran'][n % 4]
  end

  factory :race do
    name { Factory.next :race }
  end

  factory :smf_account do
    member_name { Faker::Internet.user_name }
    email_address { Faker::Internet.email }
    passwd { Digest::SHA1.hexdigest("#{member_name}password") }
    id_group 0

    factory :smf_admin do
      id_group 1
    end
  end

  factory :season do
    name
  end

  factory :user do
    name { Faker::Internet.user_name }
    association :race
  end

  factory :registration do
    association :season
    association :user
    association :race
  end

  factory :round do
    sequence(:position) {|n| n}
    starts_at { Time.now }
    ends_at { Time.now + 1.week }
    association :season
  end
end
