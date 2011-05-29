require 'machinist/active_record'
require 'sham'

Sham.define do
  name { Faker::Lorem.words(3).join(' ') }
  member_name { Faker::Internet.user_name }
  passwd { Faker::Lorem.words(1) }
  position { |n| n }
  starts_at { |n| Time.now + n.days }
  ends_at { |n| Time.now + 1.week + n.days }
  race { Race.all.shuffle.first }
end

Member.blueprint do
  member_name
  passwd
end

User.blueprint do
  name { Sham.member_name }
  race
end

Season.blueprint do
  name
end

Registration.blueprint do
  season
  user
end

Round.blueprint do
  position
  starts_at
  ends_at
  season
end

Match.blueprint do
  round
  winner { Registration.make }
end

Player.blueprint do
  match
  registration { match.winner }
  race
end
