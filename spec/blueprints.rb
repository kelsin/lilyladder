require 'machinist/active_record'
require 'sham'

Sham.define do
  name { Faker::Lorem.words(3).join(' ') }
  member_name { Faker::Internet.user_name }
  passwd { Faker::Lorem.words(1) }
end

Member.blueprint do
  member_name
  passwd
end

Race.blueprint do
  name
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
